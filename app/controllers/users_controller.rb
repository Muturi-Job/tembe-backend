class UsersController < ApplicationController
# include Authentication
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_response
  rescue_from ActiveRecord::RecordNotFound, with: :user_not_found_response

  # before_action :authorize, except: [:index, :show, :create, ]
 

  # GET /users
  def index
    render json: User.all, status: :ok
  end

  # GET /users/me
  def show
    user = User.find(params[:id])
    render json: user, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found  end

  # POST /users
  def create
    existing_user = User.find_by(email: user_params[:email])

    if existing_user
      render json: {error: "Email is already in use"}, status: :conflict
    else
    user = User.create(user_params)

    if user.valid?
      token = encode_token(user_id: user.id)
      render json: {user: user, token: token}, status: :created
    else
      render json: {errors: user.errors.full_messages },status: :unprocessable_entity
    end
  end
end

  # PATCH/PUT /users/1
  def update
    user = current_user
  
    if user
      if user.update(user_params)
        render json: user, status: :accepted
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'No active session' }, status: :unauthorized
    end
  end


  # DELETE /users/1
 def destroy
  user = current_user
  if user
    if user.destroy
    session.delete(:user_id) 
    render json: { message: 'User deleted successfully' }, status: :ok
  else
    render json: { errors: 'User not found' }, status: :not_found
  end
else
  render json: { error: 'No active session' }, status: :unauthorized

end
end


  private


    def user_params
      params.permit(:email, :password, :first_name, :last_name,:profile_image_url, :plan, :gender, :date_of_birth, :height, :weight, :age)
    end
    def render_unprocessable_response(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
  
    def user_not_found_response
      render json: { error: "User not found" }, status: :not_found
    end

   
    
end
