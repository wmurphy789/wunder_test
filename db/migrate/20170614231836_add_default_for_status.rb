class AddDefaultForStatus < ActiveRecord::Migration
  def change
  	change_column :contests, :status, :integer, :default => 0
  end
end
