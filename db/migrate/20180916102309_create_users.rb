class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :primary_contact
    	t.string :secondary_contact
    	t.string :gender
    	t.references :role, index:true
    	t.references :address, index:true
      t.timestamps
    end
  end
end