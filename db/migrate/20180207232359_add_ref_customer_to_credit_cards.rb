class AddRefCustomerToCreditCards < ActiveRecord::Migration[5.1]
  def change
    add_reference :credit_cards, :customer, foreign_key: true
  end
end
