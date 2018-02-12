require 'rails_helper'

describe "routing to books" do
  it "routes /book_by_title/:title to books#show for title" do
    expect(get: "/book_by_title/schmidt").to route_to(
      controller: "books",
      action: "show",
      title: "schmidt"
    )
  end

  it "routes /books/1 to books#show by id" do
    expect(get: "/books/1").to route_to(
      controller: "books",
      action: "show",
      id: "1"
    )
  end

  it "routes /books to books#index" do
    expect(get: "/books").to route_to(
      controller: "books",
      action: "index",
    )
  end

  it "does not expose a delete" do
    expect(delete: "/books/1").not_to be_routable
  end
end