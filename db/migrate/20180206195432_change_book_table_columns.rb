class ChangeBookTableColumns < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :title, :string, null: false
    change_column :books, :price, :decimal, precision: 10, scale: 2, null: false
    change_column :books, :books_in_stock, :integer, null: false
  end
end
