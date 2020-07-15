class ProductsController < ApplicationController
  
  def new
    @product = Product.new
    @category_parent_array =["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grand_children
    @category_grand_children = Category.find("#{params[:child_id]}").children
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      flash.now[:alert] = '入力されていない項目があります。'
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name,:price,:dealing_status,:product_introduction,:category_id,:product_condition_id,:size_id,brand:[:brand],shipment:[:area,:charge_payment,:day],product_imgs:[:image])
  end
  
end
