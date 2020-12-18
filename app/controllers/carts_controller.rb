class CartsController < ApplicationController
  def add_item
    product = Product.find(params[:id])

    current_cart.add_item(product.id)
    session[:cart9999] = current_cart.serialize

    redirect_to pricing_path, notice: '已加入購物車'
  end

  def show
  end

  def destroy
    session[:cart9999] = nil
    redirect_to pricing_path, notice: '購物車已清除！'
  end

  def checkout
    @order = Order.new
  end
  
  private
  def current_cart
    @_cart9999 ||= Cart.from_hash(session[:cart9999])
  end
end
