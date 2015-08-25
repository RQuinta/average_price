class PurchasedProductsPriceUpdater

  def initialize(purchased_product)
    @purchased_product = purchased_product
    @base_product = BaseProduct.find(purchased_product.base_product_id)
  end

  def update_price
    purchased_products = PurchasedProduct.by_base_product(@base_product.id)
    @base_product.average_price = average_price_purchased_product_calculator(purchased_products)
    @base_product.save
  end
  # handle_asynchronously :update_price,:run_at => Proc.new { 1.minutes.from_now }

  private

  def total_amount_products_calculator(purchased_products)
    purchased_products.inject(0) {|acc,product| acc + product.amount}
  end

  def total_cost_purchased_product_calculator(purchased_products)
    purchased_products.inject(0) {|acc,product| acc + (product.price * product.amount)}
  end

  def average_price_purchased_product_calculator(purchased_products)
    total_cost_purchased_product_calculator(purchased_products)/total_amount_products_calculator(purchased_products)
  end

end