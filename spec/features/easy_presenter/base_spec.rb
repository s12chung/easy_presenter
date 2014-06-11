require 'spec_helper'

describe EasyPresenter::Base, :type => :feature do
  before :each do
    @tree = Tree.create(:name => "Sakura")
  end

  describe "#url_options" do
    it "should allow using Rails #url_for helpers" do
      path = "/trees/#{@tree.id}"
      visit path
      page.should have_content "http://www.example.com#{path}"
    end
  end
end