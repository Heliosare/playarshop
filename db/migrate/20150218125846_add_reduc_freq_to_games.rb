class AddReducFreqToGames < ActiveRecord::Migration
  def change
    add_column :games, :reducFreq, :integer
  end
end
