class Label < ApplicationRecord
  belongs_to :user
  has_many :labeling_tasks, through: :labeling, source: :tasks
end
