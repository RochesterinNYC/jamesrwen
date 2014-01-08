class RenameCourseToModifier < ActiveRecord::Migration
  def change
    rename_column :projects, :course, :modifier
  end
end
