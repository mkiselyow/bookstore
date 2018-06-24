# frozen_string_literal: true

class Customers::RegistrationsController < Devise::RegistrationsController
  def create
    super
    current_or_guest_customer
  end
end
