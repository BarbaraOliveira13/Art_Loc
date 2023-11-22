class Offer < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :reservations
  validates :title, :content, :price, :category, presence: true
  mount_uploader :photo, PhotoUploader
end
