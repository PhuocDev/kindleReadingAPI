module SessionHelper
  def encode_token(payload)
    exp = 24.hours.from_now
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def auth_header
    request.headers['Authorization']
  end

  def decode_token(token)
    begin
      JWT.decode(token, Rails.application.secrets.secret_key_base).first
    rescue JWT::ExpiredSignature, JWT::DecodeError
      nil
    end
  end

  def current_user
    if auth_header
      token = auth_header.split(' ')[1]
      decoded_token = decode_token(token)
      if decoded_token
        user_id = decoded_token['user_id']
        @current_user ||= User.find_by(id: user_id)
      end
    end
  end

  def logged_in?
    !!current_user
  end

  def authenticate_request
    render json: { error: 'Not authorized' }, status: 401 unless logged_in?
  end
end
