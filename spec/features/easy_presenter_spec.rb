require 'spec_helper'

feature 'fallback to controller context' do
  background do
    @user = User.create! :first_name => 'Ji-yoon', :last_name => 'Park'
    User.create! :first_name => 'Bret', :last_name => 'Victor'

    @game = Game.create! :name => "Team Fortress 2"
    @user.games << @game
  end

  scenario 'invoke basic methods and helpers' do
    visit "/users/#{@user.id}"
    within 'a' do
      page.should have_content 'Ji-yoon Park'
    end
  end

  scenario 'nested resource' do
    visit "/users/#{@user.id}/games/#{@game.id}"
    page.should have_content 'true'
  end

  scenario 'collections and class methods' do
    visit "/users"
    page.should have_content 'Ji-yoon Park, Bret Victor'
  end
end
