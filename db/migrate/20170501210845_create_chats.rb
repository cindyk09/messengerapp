class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.references :sender, index:true
      t.references :receiver, index:true

      t.timestamps
    end
  end
end
