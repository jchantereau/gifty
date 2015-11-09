class Booking < ActiveRecord::Base
  belongs_to :gift
  belongs_to :user
  belongs_to :friend

  validates_presence_of :gift, :user, :friend
end
