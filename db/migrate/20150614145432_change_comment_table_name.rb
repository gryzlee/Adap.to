class ChangeCommentTableName < ActiveRecord::Migration
  def change
  	rename_table :comments, :comment
  end
end
