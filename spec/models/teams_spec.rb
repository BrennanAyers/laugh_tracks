require 'rails_helper'

RSpec.describe Team, type: :model do
  subject { described_class.new(name: "DotA", age: 1, location: "USA") }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an age' do
    subject.age = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a location' do
    subject.location = nil
    expect(subject).to_not be_valid
  end
end
