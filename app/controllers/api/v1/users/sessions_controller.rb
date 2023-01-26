class Api::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(current_user, _opts = {})
    if current_user.persisted?
      render json: {
        status: {
          code: :ok, message: 'Logged in successfully.'
        }
      }, status: :ok
    else
      render json: {
        status: { message: "Couldn't log in." }
      }, status: :unprocessable_entity
    end
  end

  def respond_to_on_destroy
    log_out_failure && return if current_user

    log_out_success
  end

  def log_out_success
    render json: {
      status: { code: :ok, message: 'Logged out successfully.' }
    }, status: :ok
  end

  def log_out_failure
    render json: {
      status: { message: "Couldn't log out." }
    }, status: :unprocessable_entity
  end
end
