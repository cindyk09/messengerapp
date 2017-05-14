class Chat < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :receiver, foreign_key: :receiver_id, class_name: 'User'
  has_many :messages, dependent: :destroy


  validates_uniqueness_of :sender_id, scope: :receiver_id
  # validates_uniqueness_of :receiver_id, scope: :sender_id


  # checks whether a conversation exists between these two ids because we only want two users to have one conversation.
  scope :between, -> (sender_id,receiver_id) do
    where("(chats.sender_id = ? AND chats.receiver_id = ?) OR (chats.sender_id = ? AND chats.receiver_id =?)", sender_id, receiver_id, receiver_id, sender_id)
  end
end
