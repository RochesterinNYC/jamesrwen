class Post < ActiveRecord::Base

  extend FriendlyId
  friendly_id :handle, use: :slugged

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
