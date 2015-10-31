require 'rails_helper'

RSpec.describe WishItemImage, type: :model do

  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:wish_item) }

end
