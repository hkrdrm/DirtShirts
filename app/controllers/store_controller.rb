class StoreController < ApplicationController
  def index
    @products = Product.all
    @cart = find_cart
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def add_to_cart
    begin
      product = Product.find(params[:id])
    rescue Mongoid::RecordNotFound
      logger.error("Attempt to access invalid product #{params[:id]}")
      redirect_to_index("Invalid product") 
    else
      @cart = find_cart
      @cart.add_product(product)
      #redirect_to_index
    end
  end

  def empty_cart 
    session[:cart] = nil
    redirect_to_index("Your cart is currently empty")
  end


  private 

    def redirect_to_index(msg = nil)
      flash[:notice] = msg if msg
      redirect_to :action => :index
    end

    def find_cart
      unless session[:cart]
        session[:cart] = Cart.new
      end
      session[:cart]
    end

end
