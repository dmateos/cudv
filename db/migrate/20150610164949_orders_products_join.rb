class OrdersProductsJoin < ActiveRecord::Migration
  def change
    create_table :orders_products, id: false do |t|
      t.integer :order_id
      t.integer :product_id
    end

    add_index :orders_products, :order_id
    add_index :orders_products, :product_id
  end
end
