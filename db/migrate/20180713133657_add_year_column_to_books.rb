class AddYearColumnToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :year_of_publication, :date
  end
end
