class Post < ActiveRecord::Base

  extend FriendlyId
  friendly_id :handle, use: :slugged

  validates :title, presence: true, uniqueness: true
  validates :handle, presence: true, uniqueness: true
  validates :description, presence: true
  
  def get_created_at
    created_at.strftime("%B %d, %Y")
  end

  def get_created_at_time
    created_at.strftime("%B %d, %Y at %I:%M %p")
  end

  def get_updated_at
    updated_at.strftime("%B %d, %Y")
  end

end 
