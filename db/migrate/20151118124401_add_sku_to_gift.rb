class AddSkuToGift < ActiveRecord::Migration
  def change
    add_column :gifts, :sku, :string
  end
end
