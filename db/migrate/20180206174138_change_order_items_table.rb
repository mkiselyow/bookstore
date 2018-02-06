class ChangeOrderItemsTable < ActiveRecord::Migration[5.1]
  def change
    change_column :order_items, :price, :decimal, precision: 10, scale: 2
  end
end
