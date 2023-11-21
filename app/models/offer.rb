class Offer < ApplicationRecord
  belongs_to :user
  validates :title, :content, :price, :category, presence: true
end
