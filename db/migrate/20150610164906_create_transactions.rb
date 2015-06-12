class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :user, index: true, foreign_key: true
      t.string :partner
      t.integer :cu_id
      t.integer :order_type
      t.float :total_price

      t.timestamps null: false
    end
  end
end
