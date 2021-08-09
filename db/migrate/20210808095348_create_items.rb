class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id, foreign_key: true , null: false
      t.string :name, null: false
      t.text :caption, null: false
      t.string :image_id
      t.integer :tax_excluded_price, null: false
      t.boolean :is_sales_active, null: false, default: false

      t.timestamps
    end
  end
end
