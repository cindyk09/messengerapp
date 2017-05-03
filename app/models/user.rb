class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chats, :foreign_key => :sender_id, dependent: :destroy

  validates :first_name, :last_name, :username, :email,  presence: true
  validates :email, :username, uniqueness: true
  validates :password, length: { minimum: 4 }
  validates :first_name, :last_name, length: { minimum: 2 }


end
