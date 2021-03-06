class BooksController < ApplicationController
  before_action :baria_user, only: [:edit, :destroy, :update]


  def create
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      render ("/books/index")
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book2 = Book.find(params[:id])
    @user = User.find(@book2.user_id)
    @book = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render ("books/edit")
    end
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def baria_user
    unless Book.find(params[:id]).user_id == current_user.id
      redirect_to books_path
    end
  end



end
