class Blog < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
