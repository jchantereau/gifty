class BarCategory < ActiveRecord::Base
  belongs_to :bar
  belongs_to :category
end
