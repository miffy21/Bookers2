class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update]

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "User was successfully created."
       redirect_to user_path(@user.id)
    else
       flash[:notice] = "error."
       render :edit
    end
  end

  private
  def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def correct_user
  @user = User.find(params[:id])
    if @user != current_user
       redirect_to user_path(current_user)
  end
  end
end