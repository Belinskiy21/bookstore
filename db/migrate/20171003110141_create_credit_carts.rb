class CreateCreditCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_carts do |t|
      t.string :number
      t.string :name
      t.string :cvv
      t.string :yy_mm
      t.integer :user_id

      t.timestamps
    end
    add_index :credit_carts, :user_id
  end
end
