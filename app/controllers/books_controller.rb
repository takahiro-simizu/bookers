class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:created] = "Book was successfully created."
    end
    redirect_to book_path(@book.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:updated] = "Book was successfully updated."
    end
    redirect_to book_path(book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:destroyed] = "Book was successfully destroyed."
    end
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
