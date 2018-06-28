class BooksController < ApplicationController
  def index
    @books = Book.ordered_by_title
  end

  def home
    @books = Book.ordered_by_title
    @books_latest_for_slider = Book.latest_added.limit(3)
    # flash[:notice] = "Post successfully created"
  end

  def show
    @book = Book.find(params[:id])
  end
end