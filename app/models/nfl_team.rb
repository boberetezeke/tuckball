class NflTeam < Team
  has_many :nfl_team_memberships
  has_many :players, through: :nfl_team_memberships

  default_scope ->{ order(:name) }
end