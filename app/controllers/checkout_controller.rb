class CheckoutController < ApplicationController
  def payment
    @cart = find_cart
  end
  def total
    @cart = find_cart
    @cart.total_price
  end

private
    def find_cart
      unless session[:cart]
        session[:cart] = Cart.new
      end
      session[:cart]
    end
end
