class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
			t.string :name
      t.references :property_type
      t.timestamps
    end
  end
end