class CreateShippingMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :shipping_methods do |t|
      t.string :name
      t.decimal :price
      t.integer :min_days
      t.integer :max_days

      t.timestamps
    end
  end
end
