class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      token = jwt_encode(user_id: user.id)
      time = Time.now + 7.days.to_i
      render json: { token:, exp: time.strftime('%m-%d-%Y %H:%M'),
                     username: user.username }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.require(:authentication).permit(:email, :password)
  end
end
