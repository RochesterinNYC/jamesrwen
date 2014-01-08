class Project < ActiveRecord::Base

  VALID_CATEGORIES = %w{ CLASS HACKATHON PERSONAL WORK }
  validates :title, presence: true, uniqueness: true
  validates :handle, presence: true, uniqueness: true
  validates :num_images, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates_inclusion_of :category, in: VALID_CATEGORIES

  #Create project category query and bang methods
  VALID_CATEGORIES.each do |category|
    scope category.to_s.downcase, -> { where(category: category) }
    define_method("#{category.downcase}?".to_sym) { self.category.to_s.upcase == category.to_s.upcase }
    define_method("#{category.downcase}!".to_sym) { self.category = category.to_s.upcase; self.send("after_#{category.downcase}".to_sym) if self.respond_to?("after_#{category.downcase}".to_sym); self.save! }
  end

  def self.valid_categories
    VALID_CATEGORIES
  end

  def get_images
    images ||= Array.new
    for i in 1..num_images
      image_name = handle + i.to_s + ".png"
      images << image_name
    end
    images
  end

end