class AddReducNameToGames < ActiveRecord::Migration
  def change
    add_column :games, :reducName, :string
  end
end
