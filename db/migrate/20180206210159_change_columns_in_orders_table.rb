class ChangeColumnsInOrdersTable < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :state, :string, null: false, :default => 'in progress'
    change_column :orders, :total_price, :decimal, precision: 10, scale: 2, null: false
    change_column :orders, :completed_date, :date, null: false
  end
end
