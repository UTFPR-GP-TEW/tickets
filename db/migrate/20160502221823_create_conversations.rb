class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.text :content, null: false
      t.references :ticket, index: true, foreign_key: true, null: false
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
