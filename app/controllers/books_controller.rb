class BooksController < ApplicationController
  def index
  end

  def home
    render "home"
  end

  def show
    render "book_page"
  end
end
