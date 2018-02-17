class ChangeBookTable < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :title, :string, :presence => true
    change_column :books, :price, :decimal, precision: 10, scale: 2, :presence => true
    change_column :books, :books_in_stock, :integer, :presence => true
  end
end
