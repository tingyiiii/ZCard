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
    @token = gateway.client_token.generate
  end
  
  private
  def gateway
    Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => "js6ywj3qg86ywp7w",
      :public_key => "7s4qzch7khns236z",
      :private_key => "c7ca043fe5c8f3501ee1d4493e379249",
    )
  end

end
