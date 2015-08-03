class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :username
      t.attachment :avatar
      t.boolean :is_private
      t.string :password_digest
      t.string :email

      t.timestamps null: false
    end
  end
end
