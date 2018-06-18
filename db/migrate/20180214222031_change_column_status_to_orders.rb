class ChangeColumnStatusToOrders < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :state, :string, null: false, :default => 0
  end
end
