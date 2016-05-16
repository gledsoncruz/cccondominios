class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, limit: 80
  end
end
