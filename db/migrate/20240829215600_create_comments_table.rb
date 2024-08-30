class CreateCommentsTable < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.string :author, null: false
      t.timestamps
    end
  end
end
