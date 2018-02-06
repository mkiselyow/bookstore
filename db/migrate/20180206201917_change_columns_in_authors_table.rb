class ChangeColumnsInAuthorsTable < ActiveRecord::Migration[5.1]
  def change
    change_column :authors, :firstname, :string, null: false
    change_column :authors, :lastname, :string, null: false
  end
end
