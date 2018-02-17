class ChangeColumnPasswordToCustomers < ActiveRecord::Migration[5.1]
  def change
    change_column :customers, :password, :string
  end
end
