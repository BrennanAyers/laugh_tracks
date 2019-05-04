require 'rails_helper'

RSpec.describe 'New Team', type: :feature do
  describe "As a user" do
    describe "When I visit the new Teams form" do
      it "can create a new Team" do
        visit "/teams/new"

        fill_in "Name", with: "Test"
        fill_in "Age", with: 1
        fill_in "Location", with: "Test"
        click_button "Create Team"

        new_team = Team.last

        expect(current_path).to eq("/teams")
        within("#team_#{new_team.id}") do
          expect(page).to have_content(new_team.name)
          expect(page).to have_content("Age: #{new_team.age}")
          expect(page).to have_content("Location: #{new_team.location}")
        end
      end
    end
  end
end
