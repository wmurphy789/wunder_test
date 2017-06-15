class AddMoreSpecsToContest < ActiveRecord::Migration
  def change
  	rename_column :contests, :home_stat, :home_strength
  	rename_column :contests, :away_stat, :away_strength
  	add_column :contests, :home_intelligence, :integer
  	add_column :contests, :away_intelligence, :integer
  end
end
