class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.text :text_review
      t.integer :rating_number

      t.timestamps
    end
  end
end
