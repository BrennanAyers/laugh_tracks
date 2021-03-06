require 'rails_helper'

RSpec.describe Player, type: :model do

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :winrate}
  end

  describe "associations" do
    it {should belong_to :team}
  end
end
