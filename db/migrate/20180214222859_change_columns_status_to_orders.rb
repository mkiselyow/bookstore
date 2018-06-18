class ChangeColumnsStatusToOrders < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :state, :string
  end
end
