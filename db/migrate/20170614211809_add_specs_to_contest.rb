class AddSpecsToContest < ActiveRecord::Migration
  def change
  	add_column :contests, :home_stat, :integer
  	add_column :contests, :away_stat, :integer
  end
end
