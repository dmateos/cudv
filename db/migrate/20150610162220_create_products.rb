class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.float :current_cost, null: false
      t.integer :cu_id, null: false

      t.timestamps null: false
    end
  end
end
