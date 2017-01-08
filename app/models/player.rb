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

  POSITION_VIEW_ORDER = {
      "QB" => 0,
      "RB" => 1,
      "WR" => 2,
      "TE" => 3,
      "K" => 4
  }

  def position_view_order
    POSITION_VIEW_ORDER[position]
  end

  def nfl_team
    nfl_teams.first
  end

  def is_out?
    nfl_team.is_out?
  end

  def games_played
    game_scores.count
  end
end