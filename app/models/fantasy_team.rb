class FantasyTeam < Team
  has_many :fantasy_team_memberships
  has_many :players, through: :fantasy_team_memberships

  default_scope ->{ order(:name) }

  def player_name_at_pos(pos)
    if m = /^(.*)(\d)$/.match(pos)
      pos = m[1]
      player = players.order(:name).where(position: pos)[m[2].to_i - 1]
    else
      player = players.where(position: pos).first
    end
    player.name
  end
end