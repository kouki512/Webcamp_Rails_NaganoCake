class Admin::OrderDetailsController < ApplicationController
def update
   
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    
    
    
    
    @order_detail.update(order_detail_params)
    if OrderDetail.where(made_status: "made_status_3").any?
        @order.update(status: "status_3")
    elsif @order_details.where(made_status: "made_status_4").count == @order_details.count
        @order.update(status: "status_4")
    end
    redirect_back(fallback_location: root_path)
end

private
    def order_detail_params
        
        params.require(:order_detail).permit(:made_status)
    end
end
