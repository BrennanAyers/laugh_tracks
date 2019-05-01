require 'rails_helper'

RSpec.describe Team, type: :model do
  subject { described_class.new }
  it 'is valid with valid attributes' do
    subject.name = "DotA"
    subject.age = 1
    subject.location = "USA"
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    expect(subject).to_not be_valid
  end
  
  it 'is not valid without an age'
  it 'is not valid without a location'
end
