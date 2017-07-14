class ProductsController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to '/'
    else
      render :new
    end
  end

  def show
   @product = Product.find(params[:id])
   respond_to do |format|
     format.html { render :show}
     format.js
   end
 end

 def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
      flash[:success] = "Product updated successfully!"
    else
      render :edit
    end
  end

  def destroy
   @product = Product.find(params[:id])
   @product.destroy
   respond_to do |format|
     format.html { redirect_to products_path}
     format.js
   end
 end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
