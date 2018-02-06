class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :email
      t.string :password
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
