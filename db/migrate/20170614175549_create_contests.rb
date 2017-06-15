class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
    	t.string :away_contestant
    	t.string :home_contestant
    	t.string :winner
    	t.integer :status
    	
    	t.timestamps
    end
  end
end
