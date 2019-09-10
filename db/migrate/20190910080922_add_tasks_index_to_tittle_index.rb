class AddTasksIndexToTittleIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :tasks, :tittle, :unique => true
  end
end
