class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships do |t|
      t.integer :member_id
      t.integer :joined_coop_id

      t.timestamps
    end
    add_index :memberships, :member_id
    add_index :memberships, :joined_coop_id
    add_index :memberships, [:member_id, :joined_coop_id], unique: true
  end
end
