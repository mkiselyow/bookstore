class ChangeColumnsInAddressTable < ActiveRecord::Migration[5.1]
  def change
    change_column :addresses, :address, :string, null: false
    change_column :addresses, :zipcode, :string, null: false
    change_column :addresses, :city, :string, null: false
    change_column :addresses, :phone, :string, null: false
    change_column :addresses, :country, :string, null: false
  end
end
