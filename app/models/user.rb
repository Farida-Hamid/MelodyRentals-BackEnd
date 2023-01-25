class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :instruments, dependent: :destroy, foreign_key: :user_id

  def admin?
    role == 'admin'
  end

  def regular?
    role == 'regular'
  end
 
  has_many :reservations, dependent: :destroy
end
