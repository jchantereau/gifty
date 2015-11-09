class Friend < ActiveRecord::Base

  has_many :bookings

  validates_presence_of :name
  validates :phone_number, presence: true, unless: :email?
  validates :email, presence: true, unless: :phone_number?
end
