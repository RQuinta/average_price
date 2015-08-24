class PurchasedProduct < ActiveRecord::Base

  belongs_to :base_product

  scope :by_base_product, -> (base_product) { where(base_product_id: base_product) }

  validates :base_product_id, :amount, :price, presence: true

end
