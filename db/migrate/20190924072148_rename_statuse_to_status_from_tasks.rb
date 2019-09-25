class RenameStatuseToStatusFromTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :statuse, :status
  end
end
