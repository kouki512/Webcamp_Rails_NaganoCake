class Public::OrdersController < ApplicationController
  before_action :no_cart_method
  def index
  end

  def show
  end

  def create
    
    # 注文情報の保存
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
    
    # 注文詳細の保存
    @cart_item = current_end_user.cart_items
    @cart_item.each do |cart|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart.item_id
      @order_detail.price = @order.billing
      @order_detail.amount = cart.amount
      @order_detail.made_status = 1
      @order_detail.save
    end
    
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
  
  def no_cart_method
      cart_item = current_end_user.cart_items
        if cart_item.count < 1
            flash[:no_cart] = '商品が入っていません。'
            redirect_back(fallback_location: root_path)
        end
  end
  
  
end
