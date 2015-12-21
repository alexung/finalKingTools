class ProductController < ApplicationController
  def index
      @q = Product.ransack(params[:q])
      @product = @q.result.paginate(:page => params[:page], :per_page => 9)
  end

  def show
    @items = []
    @products = Product.search(params[:search])
    @products.each do |product|
      @items.push(Product.find(product.id))
    end
    @product = Product.paginate(:page => params[:page], :per_page => 9)

  end

  def import
    Product.import(params[:file])
    redirect_to root_url, notice: "Products Imported."
  end

  def product_params
    params.require(:product).permit(:name, :image, :price, :order_number)
  end
end
