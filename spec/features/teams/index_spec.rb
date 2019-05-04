require 'rails_helper'

RSpec.describe 'teams index page', type: :feature do
  before :each do
    @team_1 = Team.create(name: "Secret", age: 4, location: "Europe", image: "https://steamcdn-a.akamaihd.net/apps/dota2/images/team_logos/1838315.png")
    @team_2 = Team.create(name: "Natus Vincere", age: 8, location: "Ukraine", image: "https://steamcdn-a.akamaihd.net/apps/dota2/images/team_logos/36.png")

    @puppey = @team_1.players.create(name: "Puppey", winrate: 0.666, image: "https://www.opendota.com/assets/images/dota2/players/87278757.png")
    @chu = @team_2.players.create(name: "Chu", winrate: 0.521, image: "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/7c/7c590378e43123beebb838e2987eb6773febe1a6_full.jpg")

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

  it 'user can see team images' do
    within "#team_#{@team_1.id}" do
      expect(page).to have_css("img[src*='team_logos/1838315.png']")
      expect(page).to have_css("img[alt='#{@team_1.name} Logo']")
    end
    within "#team_#{@team_2.id}" do
      expect(page).to have_css("img[src*='team_logos/36.png']")
      expect(page).to have_css("img[alt='#{@team_2.name} Logo']")
    end
  end

  it 'user can see player images' do
    within "#player_#{@puppey.id}" do
      expect(page).to have_css("img[src*='players/87278757.png']")
      expect(page).to have_css("img[alt='#{@puppey.name} Photo']")
    end
    within "#player_#{@chu.id}" do
      expect(page).to have_css("img[src*='7c590378e43123beebb838e2987eb6773febe1a6_full.jpg']")
      expect(page).to have_css("img[alt='#{@chu.name} Photo']")
    end
  end

  it 'displays the default image when absent' do
    team = Team.create(name: "Placeholder", age: 1, location: "Placeholder")
    player = team.players.create(name: "Placeholder", winrate: 0.5)

    visit "/teams"

    within "#team_#{team.id}" do
      expect(page).to have_css("img[src*='default']")
      expect(page).to have_css("img[alt='#{team.name} Logo']")
    end

    within "#player_#{player.id}" do
      expect(page).to have_css("img[src*='default']")
      expect(page).to have_css("img[alt='#{player.name} Photo']")
    end
  end

  it 'only displays teams with the queried age' do
    # visit "/teams?age=#{@team_1.age}

    fill_in "age", with: "#{@team_1.age}"
    click_button "Search"

    expect(page).to have_content(@team_1.name)
    expect(page).to have_content("Age: #{@team_1.age}")
    expect(page).to have_content("Location: #{@team_1.location}")

    expect(page).to_not have_content(@team_2.name)
    expect(page).to_not have_content("Age: #{@team_2.age}")
    expect(page).to_not have_content("Location: #{@team_2.location}")
  end

  it 'displays the count of players on each team' do
    team = Team.create(name: "Placeholder", age: 1, location: "Placeholder")
    player = team.players.create(name: "Placeholder", winrate: 0.5)

    within "#team_#{@team_1.id}" do
      expect(page).to have_content("Player Count: 5")
    end
    within "#team_#{team.id}" do
      expect(page).to have_content("Player Count: 1")
    end
  end
end
