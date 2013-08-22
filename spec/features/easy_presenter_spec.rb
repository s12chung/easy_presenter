require 'spec_helper'

feature 'fallback to controller context' do
  background do
    @user = User.create! :first_name => 'Ji-yoon', :last_name => 'Park'
  end

  scenario 'invoke basic methods and helpers' do
    visit "/users/#{@user.id}"
    within 'a' do
      page.should have_content 'Ji-yoon Park'
    end
  end
end
