class Api::BaseProductsController < ApplicationController

  respond_to :json

  before_action :set_base_product, only: [:update, :destroy]

  def index
    respond_with(BaseProduct.all)
  end

  def create
    @base_product = BaseProduct.create base_product_params
    respond_with :api, @base_product
  end

  def show
    respond_with :api, @base_product
  end

  def destroy
    @base_product.destroy
    respond_with :api, @base_product
  end

  private

  def base_product_params
    params.require(:base_product).permit([:name])
  end

  def set_base_product
    @base_product = BaseProduct.find params[:id]
  end

end
