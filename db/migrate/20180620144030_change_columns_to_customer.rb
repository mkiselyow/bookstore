class ChangeColumnsToCustomer < ActiveRecord::Migration[5.1]
  def change
    change_column :customers, :firstname, :string
    change_column :customers, :lastname, :string
  end
end
