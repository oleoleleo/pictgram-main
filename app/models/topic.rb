class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true

  belongs_to :user

  mount_uploader :image, ImageUploader

  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
 # def favorite_users
 #   f=[]
 #   favorites.each do |favorite|
 #     f << favorite.user
 #   end
 #   f
 # end


  has_many :comments, dependent: :destroy
end
