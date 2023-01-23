class User < ApplicationRecord
    has_secure_password
    mount_uploader :avatar, AvatarUploader
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :username, presence: true, uniqueness: true
    validates :name, presence: true, uniqueness: true
    validates :password,
              length: { minimum: 6 },
              if: -> { new_record? || !password.nil? }
    has_many :instruments, dependent: :destroy, foreign_key: :user_id
end
