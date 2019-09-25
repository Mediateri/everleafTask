class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :tittle
      t.string :content
      t.integer :statuse, default: 0
      t.string :statuses, default: 'Not_started'
      t.references :user
      t.date :deadline, null: false, default: -> { 'NOW()' }
      t.timestamps
    end
  end
end
