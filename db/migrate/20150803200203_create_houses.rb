
class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string	:title
      t.string	:content
      t.attachment	:image
      t.references :user
      t.timestamps null: false
    end
  end
end
