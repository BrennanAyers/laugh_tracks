require 'rails_helper'

RSpec.describe 'New Team', type: :feature do
  describe "As a user" do
    describe "When I visit the new Teams form" do
      it "can create a new Team" do
          visit "/teams/new"

          fill_in "name", with: "Test"
          fill_in "age", with: 1
          fill_in "location", with: "Test"
          click_button "Submit"

          new_team = Team.last

          expect(current_path).to eq("/teams/#{new_team.id}")
      end
    end
  end
end
