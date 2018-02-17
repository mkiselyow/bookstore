class AddBookRefToRatings < ActiveRecord::Migration[5.1]
  def change
    add_reference :ratings, :book, foreign_key: true
  end
end
