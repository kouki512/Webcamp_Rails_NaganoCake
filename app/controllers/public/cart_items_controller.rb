class Public::CartItemsController < ApplicationController
def index
    @cart_items = current_end_user.cart_items
    @sum = 0
    @total = 0
end
    
def create
    
    
    cart_item = CartItem.new(cart_item_params)
    cart_item.end_user_id = current_end_user.id
    cart_item_exist = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if cart_item_exist.present?
        cart_item_exist.amount += params[:cart_item][:amount].to_i
        cart_item_exist.save
    else
    cart_item.save
    end
    redirect_to cart_items_path
end

def update
    cart_items = CartItem.find(params[:id])
    cart_items.update(cart_item_params)
    redirect_back(fallback_location: root_path)
end
    
def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_back(fallback_location: root_path)
end

def destroy_all
    @cart_items = current_end_user.cart_items
    @cart_items.destroy_all
    redirect_back(fallback_location: root_path)
end


private

def cart_item_params
    params.require(:cart_item).permit(:item_id, :end_user_id, :amount)
end

end
