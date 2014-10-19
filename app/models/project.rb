class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :handle, use: :slugged

  VALID_CATEGORIES = %w{ COURSE HACKATHON PERSONAL INACTIVE }

  has_attached_file :source_download, url: "/projects/:handle/:filename"

  validates :title, presence: true, uniqueness: true
  validates :handle, presence: true, uniqueness: true
  validates :description, presence: true
  validates :category, presence: true
  validates_inclusion_of :status, in: VALID_CATEGORIES
  #Create image delete methods
  [:source_download].each do |attachment|
    define_method("#{attachment}_delete".to_sym) { self.send("#{attachment}=", nil); self.save! }
  end

  #Create project category query and bang methods
  VALID_CATEGORIES.each do |category|
    scope category.to_s.downcase, -> { where(category: category) }
    define_method("#{category.downcase}?".to_sym) { self.category.to_s.upcase == category.to_s.upcase }
    define_method("#{category.downcase}!".to_sym) { self.category = category.to_s.upcase; self.save! }
  end

  def self.valid_categories
    VALID_CATEGORIES
  end

  def delete_attachment(attachment)
    self.send("#{attachment}_delete")
  end

end
