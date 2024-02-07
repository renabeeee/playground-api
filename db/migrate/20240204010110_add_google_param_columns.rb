class AddGoogleParamColumns < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :givenName, :string
    add_column :users, :familyName, :string
  end
end
