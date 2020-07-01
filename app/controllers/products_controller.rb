class ProductsController < ApplicationController
  
  def new
    @product = Product.new
  end

  def create
    @product = products.new(product_params)
  end

  private

  def product_params
    params.require(:product).permit(:name,:price,:dealing_status,:products_introduction,category:[:name],brand:[:name],product_condition:[:product_condition],size:[:size],shipment:[:area,:charge_payment,:day],product_imgs:[:image])
  end
  
end
