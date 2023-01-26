class CreateInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :category
      t.integer :price
      t.boolean :availble, default: true
      

      t.timestamps
    end
  end
end
