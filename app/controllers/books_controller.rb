class BooksController <


  def create
    @book = Book.new
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end

  def index
    @books = Book.all
  end

  def show
  end

  def destroy
  end


  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end

end
