class BooksController < ApplicationController
  before_action :set_book, :only => [:show, :edit, :update, :destroy]
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def show
    @title = @book.name
  end

  def create
    @book = Book.new( book_params )
    if @book.save
      redirect_to books_path
      flash[:notice] = "新增成功"
    else
      render new_book_path
    end
  end

  def update
    if @book.update( book_params )
      redirect_to book_path(@book)
      flash[:notice] = "更新成功"
    else
      render edit_book_path(@book)
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
    flash[:alert] = "刪除成功"
  end

  private
    def book_params
      params.require(:book).permit(:name, :author, :description)
    end
    def set_book
      @book = Book.find(params[:id])
    end
end
