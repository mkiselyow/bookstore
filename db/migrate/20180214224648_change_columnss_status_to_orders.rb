class ChangeColumnssStatusToOrders < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :state, :string, :default => 0
  end
end
