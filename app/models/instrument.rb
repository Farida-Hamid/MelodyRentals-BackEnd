class Instrument < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :category, presence: true, length: { maximum: 50 }
  validates :image, presence: true, length: { maximum: 500 }
  validates :available, inclusion: { in: [true, false] }
end
