class ChangeCommentTable < ActiveRecord::Migration
  def change
  	rename_column :comments, :creator_id, :user_id
  	remove_column :comments, :creator_type
  end
end
