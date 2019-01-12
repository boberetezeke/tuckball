class FantasyTeam < Team
  has_many :fantasy_team_memberships
  has_many :players, through: :fantasy_team_memberships

  default_scope ->{ order(:name) }

  def player_at_pos(pos)
    fantasy_team_memberships.where(whole_pos: pos).first.player
    # if m = /^(.*)(\d)$/.match(pos)
    #   pos = m[1]
    #   player = players.order(:name).where(position: pos)[m[2].to_i - 1]
    # else
    #   player = players.where(position: pos).first
    # end
    # player
  end

  def player_name_at_pos_and_score(view_context, pos)
    player = player_at_pos(pos)
    "#{view_context.link_to(player.name, player)} <strong>#{player.score}</strong>".html_safe
  end

  STARTER_POS = ["QB", "RB1", "RB2", "WR1", "WR2", "TE", "K"]
  BACKUP_POS = ["QBB", "RBB", "WRB", "TEB", "KB"]

  def starters
    players.includes(:fantasy_team_memberships).where(FantasyTeamMembership.arel_table[:whole_pos].in(STARTER_POS))
  end

  def backups
    players.includes(:fantasy_team_memberships).where(FantasyTeamMembership.arel_table[:whole_pos].in(BACKUP_POS))
  end

  def score
    starters.map(&:score).sum
  end

  def score_for_week(week_number)
    players.map{|p| p.score_for_week(week_number)}.sum
  end

  def players_left
    players.reject(&:is_out?).size
  end

  def starters_left
    starters.reject(&:is_out?).size
  end

  def backups_left
    backups.reject(&:is_out?).size
  end
end