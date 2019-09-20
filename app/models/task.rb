class Task < ApplicationRecord
    belongs_to :user
    validates :tittle, presence: true, uniqueness: true
    enum status: [:low, :medium, :high ]
    enum statuses: [:Not_started, :Undertaking, :Completed]
    paginates_per 3
end
