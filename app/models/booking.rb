class Booking < ApplicationRecord
  belongs_to :bundles_offer
  belongs_to :user
  has_many :reviews
  validates :shipping_method, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
