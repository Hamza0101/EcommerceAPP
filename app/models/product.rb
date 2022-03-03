class Product < ApplicationRecord
  belongs_to :user

  has_many :reviews, dependent: :destroy
  has_many :line_items, dependent: :destroy

  has_one_attached :attached_image, dependent: :destroy

  after_save :assign_sr_no

  private

  def assign_sr_no
    self.serial_no = "Prd-#{id}"
  end
end
