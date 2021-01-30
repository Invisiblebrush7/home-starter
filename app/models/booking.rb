class AvailableDatesValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    bookings = Booking.where(["bundles_offer_id =?", record.bundles_offer_id])
    date_ranges = bookings.map { |b| b.start_date..b.end_date }

    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, "not available")
      end
    end
  end
end

class Booking < ApplicationRecord
  belongs_to :bundles_offer
  belongs_to :user

  validates :start_date, :end_date, available_dates: true
  has_many :reviews
  validates :shipping_method, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
