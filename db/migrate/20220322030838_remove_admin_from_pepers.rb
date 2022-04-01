class RemoveAdminFromPepers < ActiveRecord::Migration[6.0]
  def change
    remove_column :pepers, :admin, :boolean
  end
end
