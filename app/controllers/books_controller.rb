class BooksController < ApplicationController
  before_action :set_book, :only => [:show, :edit, :update, :destroy]
  Num_max_per = 10

  def index
    if params[:page]
      total_pages = Book.all.page(1).per(Num_max_per).total_pages
      params[:page] = total_pages if params[:page].to_i > total_pages
    end
    @books = Book.page(params[:page]).per(Num_max_per)
    $this_page = @books.current_page
    @count = ($this_page - 1) * Num_max_per
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
    redirect_to books_path(:page => params[:page])
    flash[:alert] = "刪除成功"
  end

  private
    def book_params
      params.require(:book).permit(:name, :author, :description, :progress)
    end
    def set_book
      @book = Book.find(params[:id])
    end
end
