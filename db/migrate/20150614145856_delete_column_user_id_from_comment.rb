class DeleteColumnUserIdFromComment < ActiveRecord::Migration
  def change
  	remove_column :comment, :user_id
  end
end
