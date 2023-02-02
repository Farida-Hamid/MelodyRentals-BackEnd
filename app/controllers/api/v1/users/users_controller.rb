class Api::V1::Users::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show update]

  def index
    @q = User.ransack(params[:q])
    @q.sorts = 'created_at desc' if @q.sorts.empty?
    @users = policy_scope @q.result.includes(:instruments)
    respond_to do |format|
      format.json { render json: UserSerializer.new(@users).serializable_hash[:data].map { |user| user[:attributes] } }
    end
  end

  def show
    authorize @user = User.find(params[:id])
    render json: { user: UserSerializer.new(@user).serializable_hash[:data][:attributes] }, status: :ok
  end

  def update
    authorize @user = User.find(params[:id])
    if @user.update(user_params)
      render json: { user: UserSerializer.new(@user).serializable_hash[:data][:attributes] }, status: :ok
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user)permit(
      :name, :username, :email, :password, :password_confirmation
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
