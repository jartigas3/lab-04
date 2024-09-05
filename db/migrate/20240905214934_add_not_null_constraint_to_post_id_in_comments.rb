class AddNotNullConstraintToPostIdInComments < ActiveRecord::Migration[7.2]
  def change
    change_column_null :comments, :post_id, false
  end
end
