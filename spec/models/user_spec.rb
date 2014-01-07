require "spec_helper"

describe User do

  context 'trying to reset password' do
    let(:user) { User.make! }
    subject { User.make! }
    it "should correctly change password" do
      @old_digest = user.password_digest
      @new_password = "newpassword123"
      user.reset_password(@new_password, @new_password)
      expect(user.password_digest).not_to eq(@old_digest)
      expect(user.authenticate(@new_password)).to be_true
    end
  end
  context "valid email addresses" do
    let(:user) { User.make! ({ email: 'ACCOUNT@test.COM'})}
    it "should have downcase email" do
      user.save
      expect(user.email).to eq("account@test.com")
    end
  end

end