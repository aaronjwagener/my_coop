class CreateManagements < ActiveRecord::Migration[5.1]
  def change
    create_table :managements do |t|
      t.integer :manager_id
      t.integer :managed_coop_id

      t.timestamps
    end
    add_index :managements, :manager_id
    add_index :managements, :managed_coop_id
    add_index :managements, [:manager_id, :managed_coop_id], unique: true
  end
end
