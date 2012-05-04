class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :topic
      t.references :user
      t.string :subject
      t.text :body

      t.timestamps
    end
    add_index :replies, :topic_id
    add_index :replies, :user_id
  end
end
