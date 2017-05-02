class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chats, :foreign_key => :sender_id

  validates :first_name, :email,  presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 4 }
  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 2 }

  has_secure_password

end
