class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def home
    flash[:notice] = "Post successfully created"
  end

  def show
    @book = Book.find(params[:id])
  end
end