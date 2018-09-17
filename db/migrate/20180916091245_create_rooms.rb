class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :sqr_ft
      t.integer :rent
      t.integer :deposit
      t.boolean :current_status
      t.integer :no_of_beds
      
      t.references :furnishing_type
      t.references :bath_type, index:true
      t.references :property,index:true
      t.references :sharing_type
      t.references :tenant_type
      
      t.timestamps
    end
  end
end
