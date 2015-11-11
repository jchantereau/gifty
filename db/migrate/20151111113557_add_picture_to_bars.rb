class AddPictureToBars < ActiveRecord::Migration
  def change
    add_column :bars, :picture, :string
  end
end
