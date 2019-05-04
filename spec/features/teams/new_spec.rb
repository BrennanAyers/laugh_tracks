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

        expect(current_path).to eq("/teams")

        within("team_#{new_team.id}") do
          expect(page).to have_content(new_team.name)
          expect(page).to have_content("Age: #{new_team.age}")
          expect(page).to have_content("Location: #{new_team.location}")
        end
      end
    end
  end
end
