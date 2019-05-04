class Team < ApplicationRecord
  has_many :players

  validates_presence_of :name, :age, :location

  def self.by_age(age)
    where(age: age).all
  end

  def player_count
    players.count
  end
end
