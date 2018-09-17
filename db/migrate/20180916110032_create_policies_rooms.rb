class CreatePoliciesRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :policies_rooms do |t|
      t.references :policy, index:true
      t.references :room, index:true
      t.timestamps
    end
  end
end