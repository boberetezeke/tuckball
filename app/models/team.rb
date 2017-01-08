class Team < ApplicationRecord
  has_many :fantasy_team_memberships
  has_many :players, through: :team_memberships
end