class Bar < ActiveRecord::Base
  belongs_to :city

  has_many :categories
  has_many :gifts
  has_many :partners
end
