class AddTokenToGames < ActiveRecord::Migration
  def change
    add_column :games, :token, :string
  end
end
