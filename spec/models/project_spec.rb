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
end