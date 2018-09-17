class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
    	t.string :address_line_1
    	t.string :address_line_2
    	t.string :nearest_landmark
      t.string :colony
      t.string :city
      t.string :state
      t.integer :pin
      t.references :addressable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
