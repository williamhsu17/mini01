class BooksController < ApplicationController
  before_action :set_book, :only => [:show, :edit, :update, :destroy]
  def index
    @books = Book.all
  end

  def new

  end

  def show
    @title = @book.name
  end

  def create

  end

  private
    def book_params

    end
    def set_book
      @book = Book.find(params[:id])
    end
end
