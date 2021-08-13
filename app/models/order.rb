class Order < ApplicationRecord
    belongs_to :end_user
    has_many :order_details
    enum payment_method: {
        credit_card: 1,
        bank: 2
    }
    enum status:{status_1: 1,status_2: 2,status_3: 3,status_4: 4,status_5: 5}
    
    
    
end
