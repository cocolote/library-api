class Product < ApplicationRecord
  belongs_to :product_type

  has_many :checkouts, dependent: :destroy
  has_many :customers, through: :checkouts, dependent: :destroy

  validates :name,
  presence: :true
end
