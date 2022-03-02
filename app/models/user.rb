class User < ApplicationRecord
  has_many :products
  has_many :reviews

  attr_accessor :first_name, :last_name

  before_save :set_fullname

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  private

  def set_fullname
    self.full_name = "#{first_name} #{last_name}"
  end
end
