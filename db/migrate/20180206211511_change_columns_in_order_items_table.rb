class ChangeColumnsInOrderItemsTable < ActiveRecord::Migration[5.1]
  def change
    change_column :order_items, :price, :decimal, precision: 10, scale: 2, null: false
    change_column :order_items, :quantity, :integer, null: false
  end
end
