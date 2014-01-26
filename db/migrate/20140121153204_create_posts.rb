class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :description, default: 'Post Description', null: false
      t.text   :content
      t.string :handle, null: false

      t.timestamps
    end
  end
end
