class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :author
      t.string :content
      t.string :notes1
      t.string :notes2
      t.string :notes3
      t.string :notes4
      t.string :notes5
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
