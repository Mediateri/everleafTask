class Task < ApplicationRecord
    belongs_to :user
    validates :Tittle, presence: true
end
