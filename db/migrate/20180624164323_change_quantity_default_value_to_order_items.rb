class ChangeQuantityDefaultValueToOrderItems < ActiveRecord::Migration[5.1]
  def change
    change_column :order_items, :quantity, :integer, :default => 1, null: false
  end
end
