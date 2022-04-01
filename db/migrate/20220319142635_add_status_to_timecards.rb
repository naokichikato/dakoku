class AddStatusToTimecards < ActiveRecord::Migration[6.0]
  def change
    add_column :timecards, :status, :integer, default: 0
  end
end
