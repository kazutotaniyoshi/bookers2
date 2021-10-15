class BooksController < ApplicationController
   def new
     @book = Book.new
   end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @book = Book.all
    @book = Book.new
  end

  def show
  end

  def destroy
  end
end
