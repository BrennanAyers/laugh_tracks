class Team < ApplicationRecord
  validates_presence_of :name, :age, :location
end
