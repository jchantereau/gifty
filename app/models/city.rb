class City < ActiveRecord::Base

  has_many :bars

  validates_presence_of :name

end
