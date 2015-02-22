class AddLevelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phoneNumber, :string
  end
end
