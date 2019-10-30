class Task < ApplicationRecord
    belongs_to :user
    validates :tittle, presence: true, uniqueness: true
    enum status: [:low, :medium, :high ]
    paginates_per 3
    belongs_to :user
    has_many :labelings, dependent: :destroy 
    has_many :labels, :through => :labelings
    accepts_nested_attributes_for :labelings, :reject_if => proc { |a|
     a['label_id'].blank? }
  accepts_nested_attributes_for :labels
end
