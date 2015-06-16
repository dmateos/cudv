class AddTotalOrdersToProduct < ActiveRecord::Migration
  def change
    add_column :products, :total_orders, :integer, default: 0 
  end
end
