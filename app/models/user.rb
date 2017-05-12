class User < ApplicationRecord

  validates :first_name, :last_name, :username, :email,  presence: true
  validates :email, :username, uniqueness: true
  validates :first_name, :last_name, length: { minimum: 2 }

  has_secure_password

  has_many :chats, dependent: :destroy, foreign_key: :sender_id
  has_many :messages, dependent: :destroy, foreign_key: :sender_id

  def self.authenticate!(email, password)
      user = self.find_by(:email => email)
      user.authenticate(password) if user
    end
end
