class Instrument < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations, dependent: :destroy

  validates :name, presence: true, lengths => { maximum: 50 }
  validates :description, presence: true, lengths => { maximum: 500 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :category, presence: true, lengths => { maximum: 50 }
  validates :image, presence: true, lengths => { maximum: 500 }, uniqueness: true
end
