class BooksController < ApplicationController
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to :root
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :price, :memo)
  end

end
