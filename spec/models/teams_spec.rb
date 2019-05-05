require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :location}
  end

  describe "associations" do
    it {should have_many :players}
  end

  describe "class methods" do
    before :each do
      @team_1 = Team.create(name: "Secret", age: 4, location: "Europe", image: "https://steamcdn-a.akamaihd.net/apps/dota2/images/team_logos/1838315.png")
      @team_2 = Team.create(name: "Natus Vincere", age: 8, location: "Ukraine", image: "https://steamcdn-a.akamaihd.net/apps/dota2/images/team_logos/36.png")
    end

    it "should only return teams by age" do
      expect(Team.by_age(4)).to eq([@team_1])
    end

    it 'should return all teams average age' do
      expect(Team.average_age).to eq(6)
    end

    it 'should return all unique team locations' do
      Team.create(name: "Not So Secret", age: 6, location: "Europe")

      expect(Team.locations).to eq(["Ukraine", "Europe"])
    end

    it 'should return all teams player counts' do
      @team_1.players.create!(name: "Puppey", winrate: 0.666, image: "https://www.opendota.com/assets/images/dota2/players/87278757.png")
      @team_1.players.create!(name: "MidOne", winrate: 0.681, image: "https://www.opendota.com/assets/images/dota2/players/116585378.png")
      @team_2.players.create!(name: "Chu", winrate: 0.521, image: "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/7c/7c590378e43123beebb838e2987eb6773febe1a6_full.jpg")

      expect (Team.total_player_count).to eq(3)
    end

    it 'should return the average player winrate of all teams' do
      @team_1.players.create!(name: "Puppey", winrate: 0.666, image: "https://www.opendota.com/assets/images/dota2/players/87278757.png")
      @team_1.players.create!(name: "MidOne", winrate: 0.681, image: "https://www.opendota.com/assets/images/dota2/players/116585378.png")
      @team_2.players.create!(name: "Chu", winrate: 0.521, image: "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/7c/7c590378e43123beebb838e2987eb6773febe1a6_full.jpg")

      expect(Team.average_player_winrate).to eq(0.623)
    end
  end

  describe "instance methods" do
    before :each do
      @team_1 = Team.create(name: "Secret", age: 4, location: "Europe", image: "https://steamcdn-a.akamaihd.net/apps/dota2/images/team_logos/1838315.png")
      @team_2 = Team.create(name: "Natus Vincere", age: 8, location: "Ukraine", image: "https://steamcdn-a.akamaihd.net/apps/dota2/images/team_logos/36.png")
    end

    it 'should return the count of players on each team' do
      @team_1.players.create!(name: "Puppey", winrate: 0.666, image: "https://www.opendota.com/assets/images/dota2/players/87278757.png")
      @team_1.players.create!(name: "MidOne", winrate: 0.681, image: "https://www.opendota.com/assets/images/dota2/players/116585378.png")
      @team_1.players.create!(name: "YapzOr", winrate: 0.676, image: "https://www.opendota.com/assets/images/dota2/players/89117038.png")
      @team_1.players.create!(name: "zai", winrate: 0.751, image: "https://www.opendota.com/assets/images/dota2/players/73562326.png")
      @team_1.players.create!(name: "Nisha", winrate: 0.758, image: "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/6d/6d7afedeb7362ba8a2ed0b0ca6cabb63b15fab80_full.jpg")
      team = Team.create(name: "Placeholder", age: 1, location: "Placeholder")
      player = team.players.create(name: "Placeholder", winrate: 0.5)

      expect(@team_1.player_count).to eq(5)
      expect(@team_2.player_count).to eq(0)
      expect(team.player_count).to eq(1)
    end
  end
end
