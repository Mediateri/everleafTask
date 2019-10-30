class Label < ApplicationRecord
  belongs_to :user
  has_many :labelings, dependent: :destroy 
  has_many :tasks, :through => :labelings
  accepts_nested_attributes_for :labelings, :reject_if => proc { |a|
   a['label_id'].blank? }
accepts_nested_attributes_for :tasks
end
