class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :handle, null: false
      t.string :description

      t.timestamps
    end

    add_attachment :uploads, :file
  end
end
