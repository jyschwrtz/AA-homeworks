class BooksController < ApplicationController
  def index
    # render json: Book.all
    @books = Book.all
  end

  def new

  end

  def create
    # p params
    new_book = Book.new(book_params)
    new_book.save
    redirect_to action: 'index'
  end

  def destroy
    book = Book.find(params[:id])
    Book.delete(book[:id])
    redirect_to action: 'index'
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
