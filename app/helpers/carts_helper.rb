module CartsHelper
  def current_cart
    @_cart9999 ||= Cart.from_hash(session[:cart9999])
  end
end
