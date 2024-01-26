class SessionsController < ApplicationController
  include Authentication
  
      def signup
          user = User.create!(user_params)
          token = encode_token(user_id: user.id)
          render json: { user: user, token: token }, status: :created
        end
      
        def login
          user = User.find_by(email: params[:email])
        
          if user&.authenticate(params[:password])
            token = encode_token(user_id: user.id)
            render json: { user: user, token: token }, status: :ok
          else
            render json: { error: 'Invalid email or password' }, status: :unauthorized
          end
        end
  
        def restore
          token = request.headers['Authorization']&.split(' ')&.last # Get token from Authorization header
          
          if token
            decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
            user_id = decoded_token.first['user_id'] # Assuming your token payload contains 'user_id'
      
            user = User.find_by(id: user_id)
      
            if user
              render json: { user: user }
            else
              render json: { error: 'User not found' }, status: :not_found
            end
          else
            render json: { error: 'Authorization token not provided' }, status: :unauthorized
          end
        rescue JWT::DecodeError
          render json: { error: 'Invalid token' }, status: :unauthorized
        end
      
        private
      
        def user_params
          params.permit(:email, :password)
        end
      end
  