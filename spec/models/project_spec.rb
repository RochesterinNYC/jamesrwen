require "spec_helper"

describe Project do
  describe 'project category methods' do
    let(:project) { Project.make! }
    Project.valid_categories.each do |category|
      context "for project category #{category}" do
        it "should have bang method to set and interrogator to ask for #{category}" do
          expect(project.send("#{category.to_s.downcase}!")).to be_true
          expect(project.send("#{category.to_s.downcase}?")).to be_true
        end
      end
    end
  end
  context "project get_image" do
    let(:project) { Project.make! ({ handle: "image_test", num_images: 3 })}
    it "should return array of proper image count" do
      expect(project.get_images.count).to eq(3)
    end
    it "should return proper image names" do
      project.get_images.each_with_index do |image_name, index|
        expect(image_name).to eq("image_test" + (index + 1).to_s + ".png")
      end
    end
  end
end