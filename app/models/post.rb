class Post < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :handle, presence: true, uniqueness: true
  validates :description, presence: true
  
  def get_created_at
    #Return formatted date
  end

  def get_modified_at
    #Return formatted date
  end

end 
