class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :parent_comment_id
      t.integer :parent_link_id
      t.integer :link_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :comments, :parent_comment_id
    add_index :comments, :parent_link_id
    add_index :comments, :link_id
    add_index :comments, :user_id
  end
end
