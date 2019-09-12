class Task < ApplicationRecord
    belongs_to :user
    validates :tittle, presence: true, uniqueness: true
    enum status: [:low, :medium, :high ]
    paginates_per 1
end
