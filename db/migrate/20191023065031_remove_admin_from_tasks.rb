class RemoveAdminFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :admin, :boolean
  end
end
