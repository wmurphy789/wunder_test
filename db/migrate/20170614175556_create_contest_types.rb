class CreateContestTypes < ActiveRecord::Migration
  def change
    create_table :contest_types do |t|
    	t.string :name
    	
    	t.timestamps
    end
  end
end
