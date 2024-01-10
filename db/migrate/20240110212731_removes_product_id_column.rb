class RemovesProductIdColumn < ActiveRecord::Migration[7.1]
  def change
    remove_column :product_images, :product_id, :string
  end
end
