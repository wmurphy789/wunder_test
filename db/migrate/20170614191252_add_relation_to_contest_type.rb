class AddRelationToContestType < ActiveRecord::Migration
  def change
  	add_column :contests, :contest_type_id, :integer
  	add_index :contests, :contest_type_id
  end
end
