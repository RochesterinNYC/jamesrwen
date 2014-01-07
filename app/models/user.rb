class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password_digest, presence: true
  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/
  has_secure_password

  def reset_password(password, password_confirmation)
    update_attributes(password: password, password_confirmation: password_confirmation)
    self.save!
  end

end


