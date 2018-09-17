class CreateExpencesRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :expences_rooms do |t|
      t.references :expence,index:true
      t.references :room,index:true
      t.timestamps
    end
  end
end
