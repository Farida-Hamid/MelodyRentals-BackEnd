class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failure
  end

  def register_success
    render json: {
      status: {
        code: 200, message: 'Registered successfully.',
        data: { user: UserSerializer.new(current_user).serializable_hash[:data][:attributes] }
      }
    }, status: :ok
  end

  def register_failure
    render json: {
      status: {
        code: 422, message: 'Registration failed.',
        error: resource.errors
      }
    }, status: :unprocessable_entity
  end
end
