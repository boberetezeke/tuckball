class Player < ApplicationRecord
  has_many :team_memberships
  has_many :nfl_teams, through: :team_memberships
  has_many :fantasy_teams, through: :team_memberships

  has_many :game_scores
end