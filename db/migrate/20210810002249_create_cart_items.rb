class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :item_id, foreign_key: true , null: false
      t.integer :end_user_id, foreign_key: true , null: false
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
