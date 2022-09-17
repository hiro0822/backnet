class CreateChatmessages < ActiveRecord::Migration[6.1]
  def change
    create_table :chatmessages do |t|
      t.references  :user, foregin_key: true
      t.references  :chatgroup, foregin_key: true
      t.text     :message,null: false
      t.timestamps
    end
  end
end
