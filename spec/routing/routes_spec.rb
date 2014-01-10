require "spec_helper"

describe "routes" do
  context "correct routing" do
    it "should route /home" do
      expect(get: "/").to route_to(controller: "pages", action: "index")
    end
    it "should route /about" do
      expect(get: "/about").to route_to(controller: "pages", action: "about")
    end
    it "should route /courses" do
      expect(get: "/courses").to route_to(controller: "projects", action: "courses")
    end
  end
end
