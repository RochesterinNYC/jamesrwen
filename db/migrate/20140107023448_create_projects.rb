class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :category, null: false, default: 'PERSONAL'
      t.string :title, null: false
      t.string :course
      t.string :description, default: 'Project Description', null: false
      t.string :site_link
      t.string :github_link
      t.string :download_link
      t.integer :priority

      t.timestamps
    end
  end
end
