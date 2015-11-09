class Category < ActiveRecord::Base

  CATEGORIES = ["Beer specialist", "Nice view", "Dating", "Cocktail genius", "students spot"]

  has_many :bar_categories

  validates :name, inclusion: { in: CATEGORIES }

end
