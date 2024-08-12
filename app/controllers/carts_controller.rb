class CartsController < CustomersController
  def show
    @order = current_order
    @cart_items = @order.carts.includes(:product, :size) if @order
  end

  def remove_from_cart
    cart_item = Cart.find(params[:id]) # Find the specific item in the cart
    cart_item.destroy
    redirect_to cart_path, notice: 'Item removed from cart'
  end
end
