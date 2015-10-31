class WishItemImage < ActiveRecord::Base

  validates :wish_item, :image, presence: true

  belongs_to :wish_item

  mount_uploader :image, WishItemImageUploader

end
