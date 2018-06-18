class AddressesController < ApplicationController
  def create
    p params
    redirect_to '/'
  end
end
