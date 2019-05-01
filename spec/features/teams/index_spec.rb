require 'rails_helper'

RSpec.describe 'teams index page', type: :feature do
  before :each do
    @team_1 = Team.create(name: "Secret", age: 4, location: "Europe")
    @team_2 = Team.create(name: "Natus Vincere", age: 8, location: "Ukraine")

    @puppey = @team_1.players.create(name: "Puppey", winrate: 0.666)
    @chu = @team_2.players.create(name: "Chu", winrate: 0.521)

    visit "/teams"
  end

  it 'user can see all teams' do
    within "#team_#{@team_1.id}" do
      expect(page).to have_content(@team_1.name)
      expect(page).to have_content("Age: #{@team_1.age}")
      expect(page).to have_content("Location: #{@team_1.location}")
    end
    within "#team_#{@team_2.id}" do
      expect(page).to have_content(@team_2.name)
      expect(page).to have_content("Age: #{@team_2.age}")
      expect(page).to have_content("Location: #{@team_2.location}")
    end
  end

  it 'user can see all players' do
    within "#team_#{@team_1.id}" do
      expect(page).to have_content "Name: #{@puppey.name}"
      expect(page).to have_content "Winrate: #{@puppey.winrate}"
    end
    within "#team_#{@team_2.id}" do
      expect(page).to have_content "Name: #{@chu.name}"
      expect(page).to have_content "Winrate: #{@chu.winrate}"
    end
  end
end
