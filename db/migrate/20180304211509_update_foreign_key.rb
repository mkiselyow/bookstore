class UpdateForeignKey < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :images, :books

    add_foreign_key :images, :books, on_delete: :cascade
  end
end
