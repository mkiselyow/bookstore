class ChangeColumnsInCreditCardsTable < ActiveRecord::Migration[5.1]
  def change
    change_column :credit_cards, :number, :string, null: false
    change_column :credit_cards, :cvv, :string, null: false
    change_column :credit_cards, :expiration_month, :string, null: false
    change_column :credit_cards, :expiration_year, :string, null: false
    change_column :credit_cards, :firstname, :string, null: false
    change_column :credit_cards, :lastname, :string, null: false
  end
end
