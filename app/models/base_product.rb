class BaseProduct < ActiveRecord::Base

  has_many :purchased_products, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true

end
