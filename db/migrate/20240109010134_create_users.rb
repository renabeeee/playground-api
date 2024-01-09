class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :pronouns, array: true
      t.string :email
      t.string :bio
      t.string :location
      t.string :birthdate
      t.string :experience
      t.string :status, default: "Player"
      t.string :profile_image
      t.timestamps
    end
  end
end
