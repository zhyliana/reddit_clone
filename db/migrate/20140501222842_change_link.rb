class ChangeLink < ActiveRecord::Migration
  def change
    remove_column :links, :sub_id
    remove_column :links, :url
    add_column :links, :url, :string, null: false, default: ""

    create_table :link_subs do |t|
      t.integer :link_id, null: false
      t.integer :sub_id, null: false

      t.timestamps
    end

    add_index :link_subs, :link_id
    add_index :link_subs, :sub_id
  end
end
