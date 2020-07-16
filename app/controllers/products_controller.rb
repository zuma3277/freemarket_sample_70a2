class ProductsController < ApplicationController
  def index
    
  end
  def new
    
  end
  def show
    @products = Product.order('created_at DESC').find(params[:id])
  end
end
