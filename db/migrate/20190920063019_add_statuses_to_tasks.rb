class AddStatusesToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :statuses, :integer, default: 0 
  end
end
