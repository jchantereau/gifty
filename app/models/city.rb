class City < ActiveRecord::Base

  has_many :bars
  has_many :pictures, as: :imageable

  validates_presence_of :name

end
