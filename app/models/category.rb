class Category < ActiveRecord::Base

  has_many :bar_categories
end
