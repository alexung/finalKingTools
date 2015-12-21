class WelcomeController < ApplicationController
  def index
      @q = Product.ransack(params[:q])
      @product = @q.result.paginate(:page => params[:page], :per_page => 9)
  end
end
