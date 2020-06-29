class ProductsController < ApplicationController
  def index
    @product = Product.new
  end

  def create
    @product = Product.create
  end

end
