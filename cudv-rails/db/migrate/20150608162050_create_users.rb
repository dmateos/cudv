class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :cu_id, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :location

      t.timestamps null: false
    end
  end
end
