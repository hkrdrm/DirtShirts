class CheckoutController < ApplicationController

  def save_order
    @cart = find_cart
    @order = Order.new(params[:order])
    @order.username = current_user.email
    @order.add_line_items_from_cart(@cart)
    if @order.save
      session[:cart] = nil
      redirect_to("/static_pages/home")
    else
      #render :action => :checkout
    end
  end

  def payment
    @cart = find_cart
  end

  def show
    @order = Order.find(params[:id])
    @cart = find_cart
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @order }
    end
  end
  def index
    @order = Order.new
    respond_to do |format|
      format.html
      format.json { render json: @order }
    end
  end
  def total
    @cart = find_cart
    @cart.total_price
  end

  def checkout
    @cart = find_cart
    if @cart.items.empty?
      redirect_to_index("Your cart is empty")
    else
      @order = Order.new
    end
  end


private
    def find_cart
      unless session[:cart]
        session[:cart] = Cart.new
      end
      session[:cart]
    end
end
