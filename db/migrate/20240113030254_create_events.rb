class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :image_url
      t.string :description
      t.string :date
      t.string :time
      t.string :location

      t.timestamps
    end
  end
end
