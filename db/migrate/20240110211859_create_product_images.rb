class CreateProductImages < ActiveRecord::Migration[7.1]
  def change
    create_table :product_images do |t|
      t.string :url
      t.string :product_id

      t.timestamps
    end
  end
end
