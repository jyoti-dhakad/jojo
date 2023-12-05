class UsersController < ApplicationController
  skip_before_action:verify_authenticity_token

  before_action :set_user, only:[:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
   
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: {error: @user.errors}
    end
  end

  def update
    
    if @user.update(user_params)
      render json: @user
    else
      render json: {error: @user.errors}
    end
  end

  def destroy
    
    if @user.destroy
      render json: {message: "bike  has been deleted successfully"}
    else
      render json: {error: @user.errors}
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

