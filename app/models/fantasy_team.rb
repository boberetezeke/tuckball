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
    (1..4).map{|week_number| score_for_week(week_number) }.sum
  end

  def players_and_score_for_week(week_number)
    players_and_scores = {}
    players_ftms = fantasy_team_memberships.group_by(&:pos)
    players_ftms.values.each do |ftms|
      if starting_player_ftms(ftms).size > starting_player_ftms_still_playing_by_week(ftms, week_number).size
        playing_ftms = starting_player_ftms_still_playing_by_week(ftms, week_number)
        backup_ftms = backup_player_ftms(ftms)
      else
        playing_ftms = starting_player_ftms(ftms)
        backup_ftms = []
      end

      playing_ftms.each do |ftm|
        players_and_scores[ftm.player] = {score: ftm.player.score_for_week(week_number), pos: ftm.whole_pos}
      end

      backup_ftms.each do |ftm|
        players_and_scores[ftm.player] = {score: ftm.player.score_for_week(week_number) / 2.0, pos: ftm.whole_pos}
      end
    end

    players_and_scores
  end

  def score_for_week(week_number)
    players_and_score_for_week(week_number).values.map{|info| info[:score]}.sum
  end

  def starting_player_ftms_still_playing_by_week(ftms, week_number)
    starting_player_ftms(ftms).select{|ftm| !ftm.player.out_in_week?(week_number)}
  end

  def starting_player_ftms(ftms)
    ftms.select{|ftm| STARTER_POS.include?(ftm.whole_pos)}
  end

  def backup_player_ftms(ftms)
    ftms.select{|ftm| BACKUP_POS.include?(ftm.whole_pos)}
  end

  def starting_players_still_playing_by_week(ftms, week_number)

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