class CreateItineraryItems < ActiveRecord::Migration
  def change
    create_table :itinerary_items do |t|
      t.date :date
      t.datetime :start_time
      t.datetime :end_time
      t.string :city
      t.string :place
      t.references :itinerary, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
