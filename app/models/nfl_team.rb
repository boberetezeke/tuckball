class NflTeam < Team
  has_many :nfl_team_memberships
  has_many :players, through: :nfl_team_memberships

  default_scope ->{ order(:name) }

  def games
    Game.where(home_team_id: self.id) + Game.where(visiting_team_id: self.id)
  end

  def is_out?
    games.select{ |game| game.lost_game?(self) }.present?
  end

  def abbrev
    if (splits = name.split(/ /)).size == 2
      splits.map{|s| s[0..0]}.join
    else
      name[0..2]
    end
  end
end