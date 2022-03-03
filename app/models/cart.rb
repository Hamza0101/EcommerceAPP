class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  def sub_total
    sum = 0
    line_items.each do |line_item|
      line_item.quantity = 1 if line_item.quantity.nil?
      sum += line_item.total_price
    end
    sum
  end
end
