class Task < ApplicationRecord
    has_many :labels
    has_many :labeling, dependent: :destroy 
    belongs_to :user
    validates :tittle, presence: true, uniqueness: true
    enum status: [:low, :medium, :high ]
    paginates_per 1
end
