class ChangePriceForGift < ActiveRecord::Migration
  def change
    rename_column :gifts, :price, :price_cents
  end
end
