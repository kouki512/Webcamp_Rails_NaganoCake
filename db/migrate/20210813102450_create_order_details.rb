class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_id, foreign_key: true , null: false
      t.integer :item_id, foreign_key: true , null: false
      t.integer :price, null: false
      t.integer :amount, null: false
      t.integer :made_status, null: false, default: 1

      t.timestamps
    end
  end
end
