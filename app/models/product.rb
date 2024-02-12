class Product < ApplicationRecord
  has_many :product_images
  has_many :carted_products
  has_many :orders, through: :carted_products

  validates :price, presence: true
  validates :price, numericality: { greater_than: 0}

  def images
    Product_image.where{product_id :id}
  end

  def is_discounted?
    price <= 10
  end

  def tax
    tax = price * 0.09
  end

  def total
    total = price + tax
  end
end
