class RenameTypeColumnToPepers < ActiveRecord::Migration[6.0]
  def change
    rename_column :pepers, :type, :kind
  end
end
