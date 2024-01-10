class AddsProductIdColumn < ActiveRecord::Migration[7.1]
  def change
    add_column :product_images, :product_id, :integer
  end
end
