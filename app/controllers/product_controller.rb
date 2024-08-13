class ProductController < ApplicationController
  before_action :authenticate_customer!

  def index
    @q = Product.ransack(params[:q])
    @pagy, @products = pagy(@q.result(distinct: true))
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
    @sizes = Size.all
  end

  def add_to_cart
    product = Product.find(params[:id])
    size_id = params[:size_id]
    quantity = params[:quantity].to_i

    if size_id.present? && quantity > 0
      size = Size.find(size_id)
      order = current_order

      if product.product_sizes.exists?(size_id: size_id)
        cart_item = Cart.find_or_initialize_by(
          order: order,
          product: product,
          size_id: size_id
        )

        if cart_item.persisted?
          cart_item.quantity += quantity
        else
          cart_item.quantity = quantity
        end
        
        cart_item.price = product.price
        cart_item.save
        redirect_to cart_path, notice: 'Product added to cart'
      end
    end
  end

  private

  def current_order
    Order.find_or_create_by(customer: current_customer, status: 'cart')
  end
end
