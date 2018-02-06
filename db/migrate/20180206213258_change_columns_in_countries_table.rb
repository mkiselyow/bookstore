class ChangeColumnsInCountriesTable < ActiveRecord::Migration[5.1]
  def change
    change_column :countries, :name, :string, null: false
  end
end
