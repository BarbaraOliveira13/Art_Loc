class Offer < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :title, :content, :price, :category, presence: true
end
