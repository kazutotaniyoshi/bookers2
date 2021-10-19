class UsersController < ApplicationController
  def show
    @users = User.find(params[:id])
    @user = @user.books.page(params[:page]).reverse_order
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
    @users = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def index
  end

end
