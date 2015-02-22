class AddReducRateToGames < ActiveRecord::Migration
  def change
    add_column :games, :reducRate, :integer
  end
end
