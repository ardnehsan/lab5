class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment_name
      t.text :comment_text
      t.integer :article_id

      t.timestamps null: false
    end
  end
end
