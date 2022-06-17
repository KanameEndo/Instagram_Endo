class Blog < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  validates :title, presence: true
  validates :content, presence: true
  mount_uploader :image, ImageUploader
end

# @blog.user => user1さん