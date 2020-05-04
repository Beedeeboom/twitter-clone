class Twite < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many_attached :twite_pictures
  validates :twite_pictures, length: {maximum: 9}
end
