class BooksController < ApplicationController
  def index; end

  def home
    flash[:notice] = "Post successfully created"
  end

  def show;  end
end
