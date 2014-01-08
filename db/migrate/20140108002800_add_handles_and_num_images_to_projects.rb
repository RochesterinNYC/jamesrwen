class AddHandlesAndNumImagesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :handle, :string, null: false, default: 'placeholder'
    add_column :projects, :num_images, :integer, null: false, default: 0
  end
end
