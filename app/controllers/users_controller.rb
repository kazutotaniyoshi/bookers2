class UsersController < ApplicationController

  def index
    @users =User.page(params[:page]).reverse_order
    @user = current_user
    @book = Book.new
  end

  def create
    @user =User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id), notice: 'successfully'
    else
    flash.now[:alert] = 'error'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @user_book = @user.books.page(params[:page]).reverse_order
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
        render :edit
    else
        redirect_to books_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id),notice: 'successfully'
    else
    render :edit
    end
  end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
