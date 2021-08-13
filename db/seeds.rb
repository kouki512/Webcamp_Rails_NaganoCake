# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: "a@a",
    password: "123456"
    )

EndUser.create!(
    last_name: "a",
    first_name: "a",
    first_name_furigana: "a",
    last_name_furigana:  "a",
    postal_code: "1",
    address: "a",
    phone_number: "1",
    email: "a@a",
    password: "123456"
    )
    
Genre.create!(
    name: "ケーキ"
    )    
    
Item.create!(
    genre_id: 1,
    name:"ケーキ",
    caption:"テストです",
    tax_excluded_price:100,
    is_sales_active:true
    ) 
Item.create!(
    genre_id: 1,
    name:"ケーキ2",
    caption:"テスト2です",
    tax_excluded_price:500,
    is_sales_active:true
    ) 
    
Address.create!(
    end_user_id: 1,
    address: "大阪府",
    postal_code: 1111111,
    name:"大阪太郎"
    )