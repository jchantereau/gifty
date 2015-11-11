class AddDescriptionToBars < ActiveRecord::Migration
  def change
    add_column :bars, :description, :string
  end
end
