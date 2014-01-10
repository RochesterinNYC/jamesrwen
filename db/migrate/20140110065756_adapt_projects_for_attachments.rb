class AdaptProjectsForAttachments < ActiveRecord::Migration
  def change
    remove_column :projects, :download_link
    remove_column :projects, :num_images
    add_attachment :projects, :source_download
    add_attachment :projects, :image1
    add_attachment :projects, :image2
    add_attachment :projects, :image3
    add_attachment :projects, :image4
    add_attachment :projects, :image5
  end
end
