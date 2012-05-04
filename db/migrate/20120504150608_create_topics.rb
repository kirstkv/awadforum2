class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :forum
      t.references :user
      t.string :subject
      t.text :body

      t.timestamps
    end
    add_index :topics, :forum_id
    add_index :topics, :user_id
  end
end
