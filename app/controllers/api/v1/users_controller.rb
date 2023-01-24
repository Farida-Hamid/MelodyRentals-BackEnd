module Api
  module V1
    class UsersController < ApplicationController
      before_action :authorize_request, except: :create

      def index
        @users = User.all
        render json: { users: UserSerializer.new(@users).serializable_hash[:data].map { |h| h[:attributes] } }, status: :ok
      end
    
      # GET /users/{username}
      def show
        @user = User.find(params[:id])
        render json: { user: UserSerializer.new(@user).serializable_hash[:data][:attributes] }, status: :ok
      end

      # POST /users
      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: { errors: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      # PUT /users/{username}
      def update
        return if @user.update(user_params)

        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end

      # DELETE /users/{username}
      def destroy
        @user.destroy
      end

      private

      def user_params
        params.permit(
          :name, :username, :email, :password, :password_confirmation
        )
      end
    end
  end
end

# change api spacing
# remove instance variables
# use rescue
# find_bt(email: params[:email])
# params.require(authentication).permit(:email, :password)
