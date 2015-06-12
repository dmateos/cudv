class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :current_cost

      t.timestamps null: false
    end
  end
end
