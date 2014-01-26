class RemoveImageAttachmentsFromProjects < ActiveRecord::Migration
  def change
    remove_attachment :projects, :image1
    remove_attachment :projects, :image2
    remove_attachment :projects, :image3
    remove_attachment :projects, :image4
    remove_attachment :projects, :image5
    remove_attachment :projects, :image6
  end
end
