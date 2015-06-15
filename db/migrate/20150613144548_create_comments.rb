class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :creator, polymorphic: true, index: true
      t.references :commentable, polymorphic: true, index: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
