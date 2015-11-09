class Gift < ActiveRecord::Base
  belongs_to :bar

  has_many :bookings

  validates_presence_of :bar

  validates_presence_of :name, :price
end
