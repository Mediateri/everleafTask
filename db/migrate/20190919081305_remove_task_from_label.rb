class RemoveTaskFromLabel < ActiveRecord::Migration[5.2]
  def change
    remove_reference :labels, :task, foreign_key: true
  end
end
