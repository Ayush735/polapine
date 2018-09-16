class CreateExpences < ActiveRecord::Migration[5.2]
  def change
    create_table :expences do |t|
    	t.string :name
      t.timestamps
    end
  end
end
