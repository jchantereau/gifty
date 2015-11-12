class Gift < ActiveRecord::Base
  belongs_to :bar

  has_many :bookings
  has_many :pictures, as: :imageable

  validates_presence_of :bar
  validates_presence_of :name, :price
end
