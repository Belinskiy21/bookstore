class AddColumnsToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :status, :boolean
    add_column :reviews, :rate, :integer
  end
end
