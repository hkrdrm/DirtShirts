class StoreController < ApplicationController
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def add_to_cart
    @cart = find_cart
    product = Product.find(params[:id])
    @cart.add_product(product)
  end

  def clear_session
    session[:cart] = nil
  end

  private 

    def find_cart
      unless session[:cart]
        session[:cart] = Cart.new
      end
      session[:cart]
    end

end
