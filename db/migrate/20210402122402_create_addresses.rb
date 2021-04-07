class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :area_id, null: false
      t.string :municipality, null: false
      t.string :address, null: false
      t.string :building
      t.string :postal_code, null: false
      t.string :tell, null: false
      t.references :purchase_record, null: false, foreign_key: true
      t.timestamps
    end
  end
end
