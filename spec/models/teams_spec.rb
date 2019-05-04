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
      expect(Team.by_age(4)).to eq(@team_1)
    end
  end
end
