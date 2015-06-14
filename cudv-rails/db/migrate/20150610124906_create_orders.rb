class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.string :partner, null: false
      t.integer :cu_id, null: false, unique: true
      t.integer :order_type, null: false
      t.float :total_price, null: false

      t.timestamps null: false
    end
  end
end
