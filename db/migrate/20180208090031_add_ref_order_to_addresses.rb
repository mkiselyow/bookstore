class AddRefOrderToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_reference :addresses, :order, foreign_key: true
  end
end
