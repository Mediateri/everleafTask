class ChangeColumnNullTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :tittle, :string, null: false
  end
end
