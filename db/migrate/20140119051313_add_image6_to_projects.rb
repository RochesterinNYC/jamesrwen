class AddImage6ToProjects < ActiveRecord::Migration
  def change
    add_attachment :projects, :image6
  end
end
