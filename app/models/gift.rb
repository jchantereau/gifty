class Gift < ActiveRecord::Base

  monetize :price_cents

  belongs_to :bar

  has_many :bookings
  has_many :pictures, as: :imageable

  validates_presence_of :bar, :name, :price

end
