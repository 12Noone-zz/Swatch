class RemovingFuckingIdFuckingFuck < ActiveRecord::Migration
  def change
  	remove_column :houses, :user_id, :project_id
  	remove_column :projects, :house_id
  end
end
