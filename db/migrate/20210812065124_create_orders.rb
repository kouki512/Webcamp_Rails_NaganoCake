class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id, foreign_key: true , null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.string :name, null: false
      t.integer :shipping, null: false, default: 800
      t.integer :billing, null: false
      t.integer :payment_method, null: false, default: 1
      t.integer :status, null: false, default: false

      t.timestamps
    end
  end
end
