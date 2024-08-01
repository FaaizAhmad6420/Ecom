class ProductController < ApplicationController
  before_action :authenticate_customer!

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @categories = Category.all
  end
end
