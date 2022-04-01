class CreatePepers < ActiveRecord::Migration[6.0]
  def change
    create_table :pepers do |t|
      t.string :kind
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
