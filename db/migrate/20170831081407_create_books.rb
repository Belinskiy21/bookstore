class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.boolean :checkbox
      t.string :image
      t.string :title
      t.integer :category_id
      t.integer :author_id
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
