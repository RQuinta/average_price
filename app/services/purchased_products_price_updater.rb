class PurchasedProductsPriceUpdater

  def initialize(purchased_product)
    @purchased_product = purchased_product
    @base_product = BaseProduct.find(purchased_product.base_product_id)
  end

  def update_price
    purchased_products = PurchasedProduct.by_base_product(@purchased_product.base_product_id)
    @base_product.price = self.average_price_purchased_product_calculator(purchased_products)
  end
  handle_asynchronously :update_price,:run_at => Proc.new { 1.minutes.from_now }

  private

  def self.total_amount_products_calculator(purchased_products)
    purchased_products.inject {|acc,product| acc += product.amount}
  end

  def self.total_cost_purchased_product_calculator(purchased_products)
    purchased_products.inject {|acc,product| acc += product.price * product.amount}
  end

  def average_price_purchased_product_calculator(purchased_products)
    self.total_cost_purchased_product_calculator(purchased_products)/self.total_amount_products_calculator(purchased_products)
  end

end