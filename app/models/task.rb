class Task < ApplicationRecord
    belongs_to :user
    validates :tittle, presence: true, uniqueness: true
    enum status: [:low, :medium, :high ], _suffix: true
end
