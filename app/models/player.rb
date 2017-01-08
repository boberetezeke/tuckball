class Player < ApplicationRecord
  has_many :fantasy_team_memberships
  has_many :fantasy_teams, through: :fantasy_team_memberships

  has_many :nfl_team_memberships
  has_many :nfl_teams, through: :nfl_team_memberships

  has_many :game_scores

  default_scope ->{ order(:name) }

  def score
    game_scores.map(&:score).sum
  end
end