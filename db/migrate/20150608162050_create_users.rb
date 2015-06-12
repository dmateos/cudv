class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :cu_id
      t.string :name
      t.string :email
      t.string :location

      t.timestamps null: false
    end
  end
end
