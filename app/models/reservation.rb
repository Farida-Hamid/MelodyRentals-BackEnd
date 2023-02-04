class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :instrument

  validates :user_id, presence: true
  validates :instrument_id, presence: true, uniqueness: { scope: :user_id }
  validates :return_date, presence: true, comparison: { greater_than: :pickup_date }
  validates :pickup_date, presence: true, comparison: { greater_than_or_equal_to: Date.today }
  validates :return_date, presence: true, comparison: { greater_than_or_equal_to: Date.today }
end
