class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :post
      t.string :name
      t.string :photo_url
      t.integer :likes, default: 0

      t.timestamps null: false
    end
  end
end
