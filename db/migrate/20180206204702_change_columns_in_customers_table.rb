class ChangeColumnsInCustomersTable < ActiveRecord::Migration[5.1]
  def change
    change_column :customers, :email, :string, null: false, unique: true
    change_column :customers, :password, :string, null: false
    change_column :customers, :firstname, :string, null: false
    change_column :customers, :lastname, :string, null: false
  end
end
