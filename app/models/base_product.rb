class BaseProduct < ActiveRecord::Base

  has_many :historico_produtos, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
  validates :average_price, presence: true

end
