class AddOvertimeToTimecards < ActiveRecord::Migration[6.0]
  def change
    add_column :timecards, :overtime, :integer, default: 0 
  end
end
