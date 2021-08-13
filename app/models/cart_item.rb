class CartItem < ApplicationRecord
    validates :amount, presence: true
    
    belongs_to :end_user
    belongs_to :item
    
    def no_cart_method
        cart_items = current_end_user.cart_items
        if cart_items.item_id == nil
            flash[:notice] = '商品が入っていません。'
            redirect_to root_path
        end
    end
end
