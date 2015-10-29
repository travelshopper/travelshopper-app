class CreateWishItems < ActiveRecord::Migration
  def change
    create_table :wish_items do |t|
      t.text :description, null: false
      t.references :itinerary_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
