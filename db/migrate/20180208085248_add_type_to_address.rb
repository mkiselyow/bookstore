class AddTypeToAddress < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :type, :string
  end
end
