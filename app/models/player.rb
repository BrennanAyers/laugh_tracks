class Player < ApplicationRecord
  validates_presence_of :name, :winrate
end
