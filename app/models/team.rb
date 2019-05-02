class Team < ApplicationRecord
  has_many :players
  
  validates_presence_of :name, :age, :location
end
