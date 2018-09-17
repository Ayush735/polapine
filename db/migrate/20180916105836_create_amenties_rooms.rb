class CreateAmentiesRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :amenties_rooms do |t|
      t.references :amenity , index:true
      t.references :room, index:true
      t.timestamps
    end
  end
end
