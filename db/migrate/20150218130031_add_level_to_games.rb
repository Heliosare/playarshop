class AddLevelToGames < ActiveRecord::Migration
  def change
    add_column :games, :level, :integer
  end
end
