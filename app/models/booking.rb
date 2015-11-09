class Booking < ActiveRecord::Base
  belongs_to :gift
  belongs_to :user
  belongs_to :friend
end
