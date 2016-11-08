class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  private
    def set_book

    end
end
