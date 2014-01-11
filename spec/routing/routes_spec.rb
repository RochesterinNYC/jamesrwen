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
    it "should route /verify" do
      expect(post: "/verify").to route_to(controller: "sessions", action: "create")
    end
    it "should route /markdown" do
      expect(post: "/markdown").to route_to(controller: "projects", action: "markdown")
    end
    it "should route /delete_attachment" do
      expect(post: "/delete_attachment").to route_to(controller: "projects", action: "delete_attachment")
    end
  end
end
