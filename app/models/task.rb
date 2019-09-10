class Task < ApplicationRecord
    belongs_to :user
    validates :tittle, presence: true, uniqueness: true
end
