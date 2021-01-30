class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :bundle
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :description, presence: true, length: { maximum: 300,
    too_long: "%{count} characters is the maximum allowed" }
end
