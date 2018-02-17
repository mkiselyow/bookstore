class ColumnPasswordToCustomers < ActiveRecord::Migration[5.1]
  def change
    change_column :customers, :password, :string, null: true
  end
end
