class CreateTimecards < ActiveRecord::Migration[6.0]
  def change
    create_table :timecards do |t|
      t.datetime :work_begin
      t.datetime :work_finish
      t.datetime :rest_begin
      t.datetime :rest_finish
      t.integer :work_time, default: 0
      t.integer :rest_time, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :timecards, [:user_id, :created_at]
  end
end
