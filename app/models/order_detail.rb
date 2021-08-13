class OrderDetail < ApplicationRecord
    enum made_status: {
        made_status_1:1,
        made_status_2:2,
        made_status_3:3,
        made_status_4:4
    }
    
    belongs_to :order
    belongs_to :item
end
