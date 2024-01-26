# app/controllers/concerns/authentication.rb
module Authentication
    def encode_token(payload)
        JWT.encode(payload, Rails.application.credentials.secret_key_base)
      end
    
      def decode_token(token)
        JWT.decode(token, Rails.application.credentials.secret_key_base)[0]
      rescue JWT::DecodeError
        nil
      end
    
  
    def current_user
      return @current_user if defined?(@current_user)
      token = request.headers['Authorization']&.split&.last
      return unless token
  
      decoded_token = decode_token(token)
      @current_user = User.find(decoded_token['user_id']) if decoded_token
    end
  
    def authenticate_user!
      render json: { error: 'Unauthorized' }, status: :unauthorized unless current_user
    end
  end
  