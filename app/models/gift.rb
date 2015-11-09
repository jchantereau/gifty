class Gift < ActiveRecord::Base
  belongs_to :bar

  has_many :bookings
end
