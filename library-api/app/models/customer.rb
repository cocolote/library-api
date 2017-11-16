class Customer < ApplicationRecord
  has_many :checkouts, dependent: :destroy
  has_many :products, through: :checkouts, dependent: :destroy

  validates :name,
  presence: true

  validates :email,
  presence: true
end
