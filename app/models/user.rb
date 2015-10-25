class User < ActiveRecord::Base

  authenticates_with_sorcery!

  validates :email, :password, :password_confirmation, presence: true
  validates :password, confirmation: true
  validates :email, uniqueness: true

end
