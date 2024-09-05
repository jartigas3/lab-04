class AddPostIdToComments < ActiveRecord::Migration[7.2]
  def change
    add_column :comments, :post_id, :integer, null: true
    add_foreign_key :comments, :posts
  end
end
