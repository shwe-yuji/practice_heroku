class BooksController < ApplicationController
  
  def create
    book = Book.new(book_params)
    if book.save
      redirect_to :root
    else
      render :root
    end
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :price, :memo)
  end

end
