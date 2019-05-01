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
end
