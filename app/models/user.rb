class User < ApplicationRecord
  has_many :chats, :foreign_key => :sender_id
  
end
