require "spec_helper"

describe "requests" do
  context "correct redirecting" do
    it "redirects to my github" do
      get "/github"
      response.should redirect_to("https://github.com/RochesterinNYC")
    end
    it "redirects to my twitter" do
      get "/twitter"
      response.should redirect_to("https://twitter.com/RochesterinNYC")
    end
  end
end