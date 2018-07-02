class BooksController < ApplicationController
  def index
    if params[:book]
      @books = Book.all          if params[:book] == "1" 
      @books = Book.latest_added if params[:book] == "2" 
      @books = Book.most_popular if params[:book] == "3"
      @books = Book.low_to_hight if params[:book] == "4"
      @books = Book.hight_to_low if params[:book] == "5"
    else
      @books = Book.all
    end
    @books_decorator = BooksDecorator.new(@books)
  end

  def home
    @books = Book.all
    @books_latest_for_slider = Book.latest_added.limit(3)
    # flash[:notice] = "Post successfully created"
  end

  def show
    @book = Book.find(params[:id])
  end


  def book_params
    params.fetch(:book, {}).permit(:book, :book_id)
  end
end