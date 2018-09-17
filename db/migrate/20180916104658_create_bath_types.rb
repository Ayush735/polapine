class CreateBathTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :bath_types do |t|
      t.string :name
      t.timestamps
    end
  end
end
