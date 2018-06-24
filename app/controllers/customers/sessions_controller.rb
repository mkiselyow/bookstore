# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  def create
    super
    current_or_guest_customer
  end
end
