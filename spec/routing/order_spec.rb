require 'rails_helper'

describe "routing to orders" do
  it "routes /orders/1 to orders#show by id" do
    expect(get: "/orders/1").to route_to(
      controller: "orders",
      action: "show",
      id: "1"
    )
  end

  it "routes /orders to orders#index" do
    expect(get: "/orders").to route_to(
      controller: "orders",
      action: "index",
    )
  end

  it "routes /orders/new to orders#new" do
    expect(get: "/orders/new").to route_to(
      controller: "orders",
      action: "new",
    )
  end

  it "does not expose a delete" do
    expect(delete: "/orders/1").not_to be_routable
  end
end