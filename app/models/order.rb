class Order < ApplicationRecord
    belongs_to :end_user
    enum payment_method: {
        "クレジットカード" => 1,
        "銀行振込" => 2
    }
    enum status:{入金待ち:1,入金確認:2,制作中:3,発送準備中:4,発送済み:5}
    
    
end
