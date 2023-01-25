class ApplicationController < ActionController::API
  before_action :authenticate_user!

  include ActionController::MimeResponds
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::UnpermittedParameters do |exception|
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  respond_to :json
  before_action :configure_permitted_parameters, if: :devise_controller?

  def not_found
    render json: { error: "#{request.method} #{request.path} does not exist" }, status: :not_found
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :name])
  end

  def user_not_authorized
    render json: { error: "You are not authorized to perform this action" }, status: :unauthorized
  end

  def record_not_found
    render json: { error: "Record not found" }, status: :not_found
  end
end
