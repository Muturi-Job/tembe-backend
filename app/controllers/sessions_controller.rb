class SessionsController < ApplicationController
    def create 
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: {error: "Invalid email or password"}, status: :unauthorized
        end
    end

    def destroy
        if session.include? :user_id
            session.delete :user_id
            render json: { message: "You have been logged out successfully." }, status: :ok

        else
            render json: {errors: ["not logged in"]}, status: :unauthorized
        end
    end
end
