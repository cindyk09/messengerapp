class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates :first_name, :last_name, :username, :email,  presence: true
  validates :email, :username, uniqueness: true
  validates :first_name, :last_name, length: { minimum: 2 }

  has_many :chats, dependent: :destroy, foreign_key: :sender_id

end
