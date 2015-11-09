class Partner < ActiveRecord::Base
  belongs_to :bar

  validates :bar, presence: true
end
