class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string     :housenumber,   null: false
      t.integer    :prefecture_id, null: false
      t.string     :town,          null: false
      t.string     :street,        null: false
      t.string     :building
      t.string     :phone,         null: false
      t.references :deal,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
