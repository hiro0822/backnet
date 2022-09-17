class CreateChatgroups < ActiveRecord::Migration[6.1]
  def change
    create_table :chatgroups do |t|
      t.string   :group_name,null: false
      t.text     :introduction
      t.timestamps
    end
  end
end
