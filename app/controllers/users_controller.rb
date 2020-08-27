class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:edit]}
  
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user = current_user
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end
end
