class FantasyTeam < Team
  has_many :fantasy_team_memberships
  has_many :players, through: :fantasy_team_memberships

  default_scope ->{ order(:name) }

  def player_at_pos(pos)
    if m = /^(.*)(\d)$/.match(pos)
      pos = m[1]
      player = players.order(:name).where(position: pos)[m[2].to_i - 1]
    else
      player = players.where(position: pos).first
    end
    player
  end

  def player_name_at_pos_and_score(pos)
    player = player_at_pos(pos)
    "#{player.name} <strong>#{player.score}</strong>".html_safe
  end

  def score
    players.map(&:score).sum
  end
end