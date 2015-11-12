class RemovePictureFromBars < ActiveRecord::Migration
  def change
    remove_column :bars, :picture, :string
  end
end
