class BarCategory < ActiveRecord::Base
  belongs_to :bar
  belongs_to :category

  validates :bar, presence: true
  validates :category, presence: true
end
