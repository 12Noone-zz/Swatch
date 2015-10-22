class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :author
      t.string :content
      t.attachment :image1

      t.timestamps null: false
    end
  end
end
