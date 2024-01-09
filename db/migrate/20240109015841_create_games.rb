class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :description
      t.string :location
      t.string :date
      t.string :time
      t.string :intensity
      t.string :player_limit
      t.string :image_url

      t.timestamps
    end
  end
end
