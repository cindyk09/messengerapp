class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :chat, index:true, foreign_key: true
      t.references :user, index:true, foreign_key: true
      t.boolean :read, deafult: false

      t.timestamps
    end
  end
end
