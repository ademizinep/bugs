class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:update]
  skip_before_action :authenticate_user!, only: %i[create]

  def create
    @user = User.new(user_params)
    if @user.save
      render :create
    else
      render json: @user.errors.full_messages
    end
  end

  def update
    if @user.update(user_params)
      render :update
    else
      render json: @user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:users).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
