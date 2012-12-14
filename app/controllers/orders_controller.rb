class OrdersController < ApplicationController
  before_filter :authorize
  def index
    @orders = Order.all

    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html
      format.json
    end
  end
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to '/orders' }
      format.json
    end
  end
  def ship
    @order = Order.find(params[:id])
    @order.shipped = true
    @order.save

    redirect_to '/orders/'+@order.id
  end

  protected
    def authorize
      if !user_signed_in? || current_user.role != 'Admin'
        redirect_to "/static_pages/home"
      end
    end
end
