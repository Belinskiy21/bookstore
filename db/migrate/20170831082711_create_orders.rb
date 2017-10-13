class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :number
      t.string :creation_date
      t.string :state

      t.timestamps
    end
  end
end
