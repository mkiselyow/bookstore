class BooksController < ApplicationController
  def index
    @books = Book.ordered_by_title
  end

  def home
    @books = Book.ordered_by_title
    @best_sellers = Book.limit(4)
    # flash[:notice] = "Post successfully created"
  end

  def show
    @book = Book.find(params[:id])
  end
end