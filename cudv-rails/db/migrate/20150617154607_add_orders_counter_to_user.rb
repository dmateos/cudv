class AddOrdersCounterToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :orders_count, :integer, :default => 0

    User.all.each do |u|
      User.update_counters u.id, :orders_count => u.orders.length
    end
  end

  def self.down
    remove_column :users, :orders_count
  end
end
