class Bar < ActiveRecord::Base
  belongs_to :city

  has_many :bar_categories
  has_many :categories, through: :bar_categories
  has_many :gifts, dependent: :destroy
  has_many :partners
  has_many :pictures, as: :imageable

  validates :city, presence: true

  accepts_nested_attributes_for :pictures, :allow_destroy => true
end
