class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :content
      t.string :author

      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
