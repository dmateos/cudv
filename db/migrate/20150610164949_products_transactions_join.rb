class ProductsTransactionsJoin < ActiveRecord::Migration
  def change
    create_table :products_transactions, id: false do |t|
      t.integer :transaction_id
      t.integer :product_id
    end

    add_index :products_transactions, :transaction_id
    add_index :products_transactions, :product_id
  end
end
