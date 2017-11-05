class RenameColumnInCreditCards < ActiveRecord::Migration[5.1]
  def change
    rename_column :credit_cards, :yy_mm, :mm_yy
  end
end
