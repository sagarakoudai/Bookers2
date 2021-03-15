class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: params[:id])
    @book = Book.new(book_params)
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new(book_params)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
    redirect_to user_path(@user.id), notice:"You have updated user successfully."
   else
    render :edit
   end
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

   def book_params
    params.permit(:title, :body)
  end


end
