class Booking < ActiveRecord::Base
  belongs_to :gift
  belongs_to :user

  validates_presence_of :gift, :user, :friend_name
  validates :friend_email, presence: true, unless: :friend_phone_number?
  validates :friend_phone_number, presence: true, unless: :friend_email?
end
