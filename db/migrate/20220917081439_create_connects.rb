class CreateConnects < ActiveRecord::Migration[6.1]
  def change
    create_table :connects do |t|
      t.integer  :chatgroup_id,null: false
      t.integer  :user_id,null: false
      t.timestamps
    end
  end
end
