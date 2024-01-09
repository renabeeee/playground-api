class CreateUsernames < ActiveRecord::Migration[7.1]
  def change
    create_table :usernames do |t|

      t.timestamps
    end
  end
end
