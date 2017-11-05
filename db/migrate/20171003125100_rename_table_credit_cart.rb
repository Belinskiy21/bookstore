class RenameTableCreditCart < ActiveRecord::Migration[5.1]
  def change
    rename_table :credit_carts, :credit_cards
  end
end
