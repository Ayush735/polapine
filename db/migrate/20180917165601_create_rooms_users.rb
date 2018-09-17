class CreateRoomsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms_users do |t|
      t.references :room, index:true
      t.references :user, index:true
      t.timestamps
    end
  end
end
