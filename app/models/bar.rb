class Bar < ActiveRecord::Base
  belongs_to :city

  has_many :categories
  has_many :gifts, dependent: :destroy
  has_many :partners

  validates :city, presence: true
end
