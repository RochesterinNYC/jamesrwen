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
      expect(user.authenticate(@new_password)).should be_true
    end
  end

end