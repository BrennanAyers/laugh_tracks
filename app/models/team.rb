class Team < ApplicationRecord
  has_many :players

  validates_presence_of :name, :age, :location

  def self.by_age(age)
    where(age: age).all
  end

  def player_count
    players.count
  end

  def self.average_age
    average(:age)
  end

  def self.locations
    select(:location).distinct.pluck(:location)
  end

  def self.total_player_count
    # total = 0
    # all.each do |team|
    #   total += team.player_count
    # end
    # total
    Player.count
  end

  def self.average_player_winrate
    # total = 0
    # all.each do |team|
    #   total += team.players.sum(:winrate)
    # end
    # total_player_count > 0 ? total / total_player_count : 0
    Player.average(:winrate)
  end
end
