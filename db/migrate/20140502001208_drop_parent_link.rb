class DropParentLink < ActiveRecord::Migration
  def change
    remove_column :comments, :parent_link_id
  end
end
