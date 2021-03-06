class BooksController < ApplicationController
  before_action :set_book, :only => [:show, :edit, :update, :destroy]
  Num_max_per = 10

  def index
    if params[:status] == "new"
      @book = Book.new

    elsif params[:status] == "update"
      set_book
    else

    end
    if params[:page]
      total_pages = Book.all.page(1).per(Num_max_per).total_pages
      params[:page] = total_pages if params[:page].to_i > total_pages
    end
    @books = Book.page(params[:page]).per(Num_max_per)
    this_page = @books.current_page
    @no_count = (this_page - 1) * Num_max_per
  end

  def new
    redirect_to books_path( :status => :new,
                            :set_book_path => books_path,
                            :set_method => :post)
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
      # render edit_book_path(@book)
      render "books/edit"
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path(:page => params[:page])
    flash[:alert] = "刪除成功"
  end

  def edit
    redirect_to books_path( :id => params[:id],
                            :status => :update,
                            :set_book_path => book_path(@book),
                            :set_method => :patch)
  end

  private
    def book_params
      params.require(:book).permit( :name,
                                    :author,
                                    :description,
                                    :progress,
                                    :published_date)
    end
    def set_book
      @book = Book.find(params[:id])
    end
end
