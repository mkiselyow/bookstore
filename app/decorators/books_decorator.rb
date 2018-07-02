class BooksDecorator
  attr_reader :books, :book

  def initialize(books, book)
    @book  = book
    @books = books
  end

  def price_in_eu
    ActionController::Base.helpers.number_to_currency(
      self.price, locale: :fr
      )
  end

  def method_missing(method_name, *args, &block)
    books.send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_private = false)
    books.respond_to?(method_name, include_private) || super
  end
end