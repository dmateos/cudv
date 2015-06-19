class CreateDonationsOrgs < ActiveRecord::Migration
  def change
    create_table :donations_orgs do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.string :name, null: false
      t.integer :cu_id, null: false
      t.datetime :registered_at, null: false
      t.string :status
      t.float :budget, null: false

      t.timestamps null: false
    end
  end
end
