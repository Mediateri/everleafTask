class AddStatusesToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :statuses, :string, default: 'Not_started' 
  end
end
