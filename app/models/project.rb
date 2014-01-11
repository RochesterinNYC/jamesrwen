class Project < ActiveRecord::Base

  VALID_CATEGORIES = %w{ COURSE HACKATHON PERSONAL }

  has_attached_file :source_download, url: "/projects/:handle/:filename"
  has_attached_file :image1, url: "/projects/:handle/:basename_:style.:extension", styles: { :thumbnail => "100x100>", :regular => "300x300>" }
  has_attached_file :image2, url: "/projects/:handle/:basename_:style.:extension", styles: { thumbnail: "100x100>", regular: "300x300>" }
  has_attached_file :image3, url: "/projects/:handle/:basename_:style.:extension", styles: { thumbnail: "100x100>", regular: "300x300>" }
  has_attached_file :image4, url: "/projects/:handle/:basename_:style.:extension", styles: { thumbnail: "100x100>", regular: "300x300>" }
  has_attached_file :image5, url: "/projects/:handle/:basename_:style.:extension", styles: { thumbnail: "100x100>", regular: "300x300>" }
  
  validates :title, presence: true, uniqueness: true
  validates :handle, presence: true, uniqueness: true
  validates :description, presence: true
  validates :category, presence: true
  validates_inclusion_of :category, in: VALID_CATEGORIES
  [:image1, :image2, :image3, :image4, :image5].each do |image|
    validates_attachment image, content_type: { content_type: ["image/jpg", "image/gif", "image/png"] }
  end
  #Create image delete methods
  [:image1, :image2, :image3, :image4, :image5, :source_download].each do |attachment|
    define_method("#{attachment}_delete".to_sym) { self.send("#{attachment}=", nil); self.save! }
  end

  #Create project category query and bang methods
  VALID_CATEGORIES.each do |category|
    scope category.to_s.downcase, -> { where(category: category) }
    define_method("#{category.downcase}?".to_sym) { self.category.to_s.upcase == category.to_s.upcase }
    define_method("#{category.downcase}!".to_sym) { self.category = category.to_s.upcase; self.send("after_#{category.downcase}".to_sym) if self.respond_to?("after_#{category.downcase}".to_sym); self.save! }
  end

  def self.valid_categories
    VALID_CATEGORIES
  end

end