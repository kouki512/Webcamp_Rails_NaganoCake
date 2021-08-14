class Admin::OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
    @sum = 0
    @total = 0
    @tax = 1.1
    @order_detail = @order.order_details.all
    # 合計金額と請求金額の計算
    @order.order_details.each do |order_detail|
      @sum += (order_detail.item.tax_excluded_price * order_detail.amount * @tax).floor
    end
    @total += @sum + @order.shipping
    #/合計金額と請求金額の計算
    
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(admin_order_params)
    
    if @order.status == "status_2"
      @order_detail = @order.order_details
      @order_detail.each do |status|
        status.update(made_status: "made_status_2" )
      end
    end
    redirect_back(fallback_location: root_path)
  end
  
  private
    def admin_order_params
      params.require(:order).permit(:status)
    end
    
    def order_detail_params
        params.require(:order_detail).permit(:made_status)
    end
end
