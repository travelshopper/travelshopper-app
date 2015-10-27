class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :country_code, null: false

      t.timestamps null: false
    end

    add_index :itineraries, :country_code
  end
end
