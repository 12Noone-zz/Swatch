class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :author
      t.string :content
      t.string :notes
      t.attachment :image1
      t.attachment :image2
      t.attachment :image3
      t.attachment :image4
      t.attachment :image5
      
      t.references :house, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
