class Public::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def create
    
    @order = Order.new(
        address: session[:address],
        postal_code: session[:postal_code],
        name: session[:name],
        payment_method: session[:payment_method],
        shipping: 800,
        status: 1,
        end_user_id: current_end_user.id,
      )
      @order.billing = session[:sum]
    
    @order.save
    redirect_to orders_decision_path
      
  end

  def new
    @order = Order.new
    @select_address = current_end_user.addresses.all
  end

  def confirm
    
  @end_user = EndUser.find(current_end_user.id)
  if params[:order][:address_option] == "0"
      session[:address] = @end_user.address
      session[:postal_code] = @end_user.postal_code
      session[:name] = @end_user.last_name + @end_user.first_name
      session[:payment_method] = orders_params[:payment_method]
  elsif params[:order][:address_option] == "1"
   @select_address = current_end_user.addresses.find(orders_params[:select_addresses])
      session[:payment_method] = orders_params[:payment_method]
      session[:postal_code] = @select_address.postal_code
      session[:address] = @select_address.address
      session[:name] = @select_address.name
  elsif params[:order][:address_option] == "2"
      session[:address] = orders_params[:address]
      session[:postal_code] = orders_params[:postal_code]
      session[:name] = orders_params[:name]
      session[:payment_method] = orders_params[:payment_method]
  end
  @cart_item = current_end_user.cart_items
  @order = Order.new(
    
    payment_method: session[:payment_method],
    address: session[:address],
    postal_code: session[:postal_code],
    name: session[:name],
    shipping: 800
    )
    @sum = 0
    @total = 0
    
    @cart_item.each do |cart|
      @total += cart.item.tax_excluded_price * cart.amount
      session[:sum] = @total + @order.shipping
    end
  end

  def decision
  end
  
  private
  def orders_params
    params.require(:order).permit(:payment_method,:address_option,:postal_code,:address,:name,:select_addresses)
  end
  
end
