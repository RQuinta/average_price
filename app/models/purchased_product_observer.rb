class PurchasedProductObserver < ActiveRecord::Observer

  def after_save(purchased_product)
    PurchasedProductsPriceUpdater.new(purchased_product).update_price
  end


end