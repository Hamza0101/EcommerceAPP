class AddPriceToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :price, :bigint
  end
end
