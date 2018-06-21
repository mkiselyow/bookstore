class ChangeTwoColumnsToCustomer < ActiveRecord::Migration[5.1]
  def change
    change_column :customers, :firstname, :string, null: true
    change_column :customers, :lastname, :string, null: true
  end
end
