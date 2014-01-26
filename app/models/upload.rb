class Upload < ActiveRecord::Base

  validates :handle, presence: true

  has_attached_file :file, url: "/uploads/:filename/:basename_:style.:extension", styles: { :thumbnail => "100x100>", :regular => "300x300>" }

  [:file].each do |attachment|
    define_method("#{attachment}_delete".to_sym) { self.send("#{attachment}=", nil); self.save! }
  end

  def delete_attachment(attachment)
    self.send("#{attachment}_delete")
  end

end
