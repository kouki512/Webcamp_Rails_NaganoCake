class Item < ApplicationRecord
    belongs_to :genre
    has_many :cart_items
    has_many :order_details
    attachment :image
    
    def self.search(search)
        if search
            where(['name LIKE? ',"%#{search}%"])
        else
            all
        end
    end
    # def self.genre_search(search)
    #     if search
    #         where(genre_id: params[:genre_id])
    #     else 
    #         all
    #     end
    # end
end
