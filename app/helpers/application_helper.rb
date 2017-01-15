module ApplicationHelper
  def breadcrumbs_html_safe
    #@breadcrumbs = [["Mechanics Tracker", root_path]] + (@breadcrumbs || [])
    @breadcrumbs = (@breadcrumbs || [])
    @breadcrumbs.map do |title, link|
      if link
        link_to(title, link)
      else
        title
      end
    end.join(" | ").html_safe
  end

  def breadcrumbs(*args)
    @breadcrumbs = args.map do |name_and_link|
      if name_and_link.is_a?(Array)
        if name_and_link.size == 2
          name_and_link
        else
          raise "name and link only expected in array: #{name_and_link}"
        end
      elsif name_and_link.is_a?(String)
        [name_and_link, nil]
      else
        raise "Expect either a two element array or a string for a breadcrumb: #{name_and_link.inspect}"
      end
    end
  end

  def title
    if @breadcrumbs
      @breadcrumbs.last.first
    else
      "Tuckball - Playoff Fantasy Football"
    end
  end

  def player_link(player)
    link_to(player.name, player, class: player.is_out? ? "player-is-out" : "")
  end

  def nfl_team_link(nfl_team)
    link_to(nfl_team.name, nfl_team, class: nfl_team.is_out? ? "team-is-out" : "")
  end

  def fantasy_team_link(fantasy_team)
    link_to(fantasy_team.name, fantasy_team)
  end

  def player_name_at_pos_and_score(fantasy_team, pos)
    player = fantasy_team.player_at_pos(pos)
    "#{player_link(player)} (#{player.nfl_team.abbrev}) <strong>#{player.score}</strong>".html_safe
  end
end
