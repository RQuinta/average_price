class Api::PurchasedProductsController < ApplicationController

  respond_to :json

  def index
    respond_with apply_scopes(PurchasedProduct).all
  end

  def create
    @purchased_product = PurchasedProduct.create purchased_product_params
    respond_with :api, @purchased_product
  end

  def show
    respond_with :api, @purchased_product
  end

  private

  def purchased_product_params
    params.require(:purchased_product).permit([:price, :amount, :base_product_id])
  end

end
