class AddUserToComments < ActiveRecord::Migration
  def change
    add_reference :comment, :user, index: true
  end
end
