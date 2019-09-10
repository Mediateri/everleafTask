class Task < ApplicationRecord
    belongs_to :user
    validates :tittle, presence: true
end
