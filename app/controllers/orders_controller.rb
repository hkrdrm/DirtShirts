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

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
	format.json { head :no_content }
      else
        format.html { render action: "edit" }
	format.json { render json: @order.errors, status: unprocessable_entity }
      end
    end
  end

  def ship_order(order)
    @order = Order.find(order.id)
    @order.shipped = true

    respond_to do |format|
      if @order.save
        format.html { redirect_to "/orders" }
	format.json { head :no_content }
      else
        format.html { render action: "ship_order" }
	format.json { render json: @order.errors, status: unprocessable_entity }
      end
    end
  end

  protected
    def authorize
      if !user_signed_in?
        redirect_to "/static_pages/home"
      end
    end
end
