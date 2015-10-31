class CreateWishItemImages < ActiveRecord::Migration
  def change
    create_table :wish_item_images do |t|
      t.string :image, null: false
      t.references :wish_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
