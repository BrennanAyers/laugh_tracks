require 'rails_helper'

RSpec.describe 'As a user', type: :feature do
  before :each do
    @team_1 = Team.create(name: "Secret", age: 4, location: "Europe", image: "https://steamcdn-a.akamaihd.net/apps/dota2/images/team_logos/1838315.png")
    @team_2 = Team.create(name: "Natus Vincere", age: 8, location: "Ukraine", image: "https://steamcdn-a.akamaihd.net/apps/dota2/images/team_logos/36.png")

    @puppey = @team_1.players.create(name: "Puppey", winrate: 0.666, image: "https://www.opendota.com/assets/images/dota2/players/87278757.png")
    @chu = @team_2.players.create(name: "Chu", winrate: 0.521, image: "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/7c/7c590378e43123beebb838e2987eb6773febe1a6_full.jpg")
  end

  describe 'When I visit a Team show page' do
    it 'shows only that Teams information' do
      visit "/teams/#{@team_1.id}"

      expect(page).to have_content(@team_1.name)
      expect(page).to have_content("Age: #{@team_1.age}")
      expect(page).to have_content("Location: #{@team_1.location}")

      expect(page).to_not have_content(@team_2.name)
      expect(page).to_not have_content("Age: #{@team_2.age}")
      expect(page).to_not have_content("Location: #{@team_2.location}")
    end
  end
end
