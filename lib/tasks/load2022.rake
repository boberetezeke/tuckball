namespace :destroy do
  desc "delete games"
  task :games => :environment do
    Game.destroy_all
    puts "deleted all games"
  end
  task :fantasy_teams => :environment do
    FantasyTeam.destroy_all
    puts "deleted all fantasy teams"
  end
  task :nfl_teams => :environment do
    NflTeam.destroy_all
    puts "deleted all fantasy teams"
  end
  task :all => :environment do
    Game.destroy_all
    FantasyTeam.destroy_all
    NflTeam.destroy_all
    Player.destroy_all
    NflTeamMembership.destroy_all
    FantasyTeamMembership.destroy_all
    puts "destroyed all"
  end
end

namespace :load do
  desc "load all the things"
  task :all => [:fantasy_teams, :games]

  desc "load up fantasy teams"
  task :fantasy_teams => :environment do
    teams = {
      "Steve" =>  {
        "QB"  => ["Patrick Mahomes",    "Kansas City"],
        "QBB" => ["Joe Burrow",         "Cincinatti"],
        "RB1" => ["Austin Eckeler",     "Los Angeles"],
        "RB2" => ["James Cook",         "Buffalo"],
        "RBB" => ["Miles Sanders",      "Philadelphia"],
        "WR1" => ["Ja'marr Chase",      "Cincinatti"],
        "WR2" => ["AJ Brown",           "Philadelphia"],
        "WRB" => ["Justin Jefferson",   "Minnesota"],
        "TE" =>  ["George Kittle",      "San Francisco"],
        "TEB" => ["TJ Hockenson",       "Minnesota"],
        "K" =>   ["Greg Joseph",        "Minnesota"],
        "KB" =>  ["Robbie Gould",       "San Francisco"],
      },

      "Josh" => {
        "QB"  => ["Jalen Hurts",          "Philadelphia"],
        "QBB"  => ["Patrick Mahomes",     "Kansas City"],
        "RB1"  => ["Christian McCaffrey", "San Francisco"],
        "RB2" => ["Austin Eckeler",       "San Diego"],
        "RBB" => ["Joe Mixon",            "Cincinatti"],
        "WR1" => ["Ja'marr Chase",        "Cincinatti"],
        "WR2" => ["Cee Dee Lamb",         "Dallas"],
        "WRB" => ["Stefon Diggs",        "Buffalo"],
        "TE" =>  ["Travis Kelce",         "Kansas City"],
        "TEB" => ["George Kittle",        "San Francisco"],
        "K" =>   ["Tyler Bass",           "Buffalo"],
        "KB" =>  ["Harrison Butker",      "Kansas City"],
      },

      "Gordy" => {
        "QB" => ["Patrick Mahomes",     "Kansas City"],
        "QBB" => ["Joe Burrow",         "Cincinatti"],
        "RB1" => ["Miles Sanders",      "Philadelphia"],
        "RB2" => ["Joe Mixon",          "Cincinatti"],
        "RBB" => ["Dalvin Cook",        "Minnesota"],
        "WR1" => ["Justin Jefferson",   "Minnesota"],
        "WR2" => ["Stefon Diggs",       "Buffalo"],
        "WRB" => ["AJ Brown",           "Philadelphia"],
        "TE" => ["George Kittle",       "San Francisco"],
        "TEB" => ["Travis Kelce",       "Kansas City"],
        "K" =>  ["Brett Maher",         "Dallas"],
        "KB" => ["Robbie Gould",        "San Francisco"],
      },

      "Roger" => {
        "QB"  => ["Josh Allen",         "Buffalo"],
        "QBB"  => ["Patrick Mahomes",   "Kansas City"],
        "RB1" => ["Tony Pollard",       "Dallas"],
        "RB2" => ["Christian McCaffrey","San Francisco"],
        "RBB" => ["Miles Sanders",      "Philadelphia"],
        "WR1" => ["Justin Jefferson",   "Minnesota"],
        "WR2" => ["AJ Brown",           "Philadelphia"],
        "WRB" => ["Stefon Diggs",       "Buffalo"],
        "TE" =>  ["Noah Fant",          "Seattle"],
        "TEB" => ["Travis Kelce",       "Kansas City"],
        "K" =>   ["Evan McPherson",     "Cincinatti"],
        "KB" =>  ["Tyler Bass",         "Buffalo"],
      },

      "Ron" => {
        "QB"  => ["Joe Burrow",          "Cincinatti"],
        "QBB"  => ["Patrick Mahomes",    "Kansas City"],
        "RB1" => ["Miles Sanders",       "Philadelphia"],
        "RB2" => ["Tony Pollard",        "Dallas"],
        "RBB" => ["Christian McCaffrey", "San Francisco"],
        "WR1" => ["Stefon Diggs",        "Buffalo"],
        "WR2" => ["Justin Jefferson",    "Minnesota"],
        "WRB" => ["AJ Brown",            "Philadelphia"],
        "TE" =>  ["Travis Kelce",        "Kansas City"],
        "TEB" => ["Dawson Knox",         "Buffalo"],
        "K" =>   ["Robbie Gould",        "San Francisco"],
        "KB" =>  ["Tyler Bass",          "Buffalo"],
      },

      "Melanie" => {
        "QB" => ["Jalen Hurts",          "Philadelphia"],
        "QBB" => ["Patrick Mahomes",     "Kansas City"],
        "RB1" => ["Christian McCaffrey", "San Francisco"],
        "RB2" => ["Joe Mixon",           "Cincinatti"],
        "RBB" => ["Austin Eckeler",      "Los Angeles"],
        "WR1" => ["Stefon Diggs",        "Buffalo"],
        "WR2" => ["Cee Dee Lamb",        "Dallas"],
        "WRB" => ["Ja'marr Chase",       "Cincinatti"],
        "TE" =>  ["Travis Kelce",        "Kansas City"],
        "TEB" => ["Dallas Goedert",      "Philadelphia"],
        "K" =>   ["Cameron Dicker",      "Los Angeles"],
        "KB" =>  ["Tyler Bass",          "Buffalo"],
      },

      "David" => {
        "QB"  => ["Patrick Mahomes",    "Kansas City"],
        "QBB" => ["Josh Allen",         "Buffalo"],
        "RB1" => ["Tony Pollard",       "Dallas"],
        "RB2" => ["Christian McCaffrey", "San Franscisco"],
        "RBB" => ["Joe Mixon",          "Cincinatti"],
        "WR1" => ["Stefon Diggs",       "Buffalo"],
        "WR2" => ["Ja'marr Chase",      "Cincinatti"],
        "WRB" => ["Cee Dee Lamb",       "Dallas"],
        "TE" =>  ["TJ Hockenson",       "Minnesota"],
        "TEB" => ["Travis Kelce",       "Kansas City"],
        "K" =>   ["Jake Elliot",        "Philadelphia"],
        "KB" =>  ["Brett Maher",        "Dallas"],
      },

      "Pat" => {
        "QB"  => ["Josh Allen",         "Buffalo"],
        "QBB" => ["Patrick Mahomes",    "Kansas City"],
        "RB1" => ["Christian McCaffrey","San Francisco"],
        "RB2" => ["Saquon Barkley",     "New York Giants"],
        "RBB" => ["Miles Sanders",      "Philadelphia"],
        "WR1" => ["Ja'marr Chase",      "Cincinatti"],
        "WR2" => ["AJ Brown",           "Philadelphia"],
        "WRB" => ["Stefon Diggs",       "Buffalo"],
        "TE" =>  ["Travis Kelce",       "Kansas City"],
        "TEB" => ["George Kittle",      "San Francisco"],
        "K" =>   ["Riley Patterson",    "Jacksonville"],
        "KB" =>  ["Robbie Gould",       "San Francisco"],
      },

      "Mike" => {
        "QB"  => ["Patrick Mahomes",    "Kansas City"],
        "QBB" => ["Josh Allen",         "Buffalo"],
        "RB1" => ["Christian McCaffrey","San Francisco"],
        "RB2" => ["Austin Eckeler",     "Los Angeles"],
        "RBB" => ["Dalvin Cook",        "Minnesota"],
        "WR1" => ["Cee Dee Lamb",       "Dallas"],
        "WR2" => ["Justin Jefferson",   "Minnesota"],
        "WRB" => ["",                   ""],
        "TE" =>  ["Mark Andrews",       "Baltimore"],
        "TEB" => ["Travis Kelce",       "Kansas City"],
        "K" =>   ["Graham Gano",        "New York"],
        "KB" =>  ["Robbie Gould",       "San Francisco"],
      },

      "Greg" => {
        "QB"  => ["Josh Allen",          "Buffalo"],
        "QBB" => ["Patrick Mahomes",     "Kansas City"],
        "RB1" => ["Christian McCaffrey", "San Francisco"],
        "RB2" => ["Austin Eckeler",      "Los Angeles"],
        "RBB" => ["Joe Mixon",           "Cincinatti"],
        "WR1" => ["Justin Jefferson",    "Minnesota"],
        "WR2" => ["Ja'marr Chase",       "Cincinatti"],
        "WRB" => ["Stefon Diggs",        "Buffalo"],
        "TE" =>  ["Travis Kelce",        "Kansas City"],
        "TEB" => ["Dawson Knox",         "Buffalo"],
        "K" =>   ["Jake Elliot",         "Philadelphia"],
        "KB" =>  ["Tyler Bass",          "Buffalo"],
      },

      "John" => {
        "QB"  => ["Josh Allen",         "Buffalo"],
        "QBB"  => ["Patrick Mahomes",   "Kansas City"],
        "RB1" => ["Joe Mixon",          "Cincinatti"],
        "RB2" => ["Christian McCaffrey","San Francisco"],
        "RBB" => ["Austin Eckeler",     "Los Angeles"],
        "WR1" => ["Cee Dee Lamb",       "Dallas"],
        "WR2" => ["Justin Jefferson",   "Minnesota"],
        "WRB" => ["AJ Brown",           "Philadelphia"],
        "TE" =>  ["Travis Kelce",       "Kansas City"],
        "TEB" => ["Dawson Knox",        "Buffalo"],
        "K" =>   ["Jake Elliot",        "Philadelphia"],
        "KB" =>  ["Harrison Butker",    "Kansas City"],
      },

    }

    injuries = {
      # "Leonard Fournette" => [1]
    }

    missing_teams = [
      'Miami',
      'Tampa Bay'
    ]

    missing_teams.each do |team_name|
      NflTeam.find_or_create_by(name: team_name)
    end

    teams.each do |person, team|
      if FantasyTeam.find_by_name(person).nil?
        fantasy_team = FantasyTeam.create(name: person)

        puts "creating team for: #{person}"
        team.each do |whole_pos, (player_name, team_name)|
          pos = whole_pos
          pos = "QB" if whole_pos == "QBB"
          pos = "WR" if whole_pos == "WR1" || whole_pos == "WR2" || whole_pos == "WRB"
          pos = "RB" if whole_pos == "RB1" || whole_pos == "RB2" || whole_pos == "RBB"
          pos = "TE" if whole_pos == "TEB"
          pos = "K"  if whole_pos == "KB"
          player = Player.find_or_create_by(name: player_name, position: pos)
          FantasyTeamMembership.create(fantasy_team: fantasy_team, player: player, whole_pos: whole_pos)

          nfl_team = NflTeam.find_or_create_by(name: team_name)
          nfl_team.players << player
        end
      end
    end

    injuries.each do |name, weeks_out|
      player = Player.find_by_name(name)
      if player
        player.update(weeks_out: weeks_out)
      else
        puts "ERROR: can't find player for injuries: #{name}"
      end
    end
  end


  desc "load up games"
  task :games => :environment do
    # "x y" =>              [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
    games = {
      ["Miami", "Buffalo", Time.utc(2023, 1, 15, 15, 30), 31, 34] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss

        "Josh Allen" =>      [ 3,     2,      0,     0,      352,   0,      20,     1,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "James Cook" =>      [ 0,     0,      0,     1,      0,     0,      39,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Stefon Diggs" =>    [ 0,     0,      0,     0,      0,     114,    0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Dawson Knox" =>     [ 0,     0,      1,     0,      0,     20,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Tyler Bass" =>      [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      2,      0,       0,     4,   0      ],
      },

      ["Baltimore", "Cincinatti", Time.utc(2023, 1, 15, 15, 30), 17, 24] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Mark Andrews" =>   [ 0,     0,      0,     0,      0,     73,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],

        "Joe Burrow" =>     [ 1,     0,      0,     0,      209,   0,      9,      1,     1,      0,      0,      0,      0,       0,     0,   0      ],
        "Joe Mixon" =>      [ 0,     0,      0,     0,      0,     0,      39,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Ja'marr Chase" =>  [ 0,     0,      1,     0,      0,     84,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Evan McPherson" => [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      1,      0,       0,     1,   1      ],
      },

      ["Los Angeles", "Jacksonville", Time.utc(2023, 1, 15, 15, 30), 30, 31] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Austin Eckeler" =>   [ 0,     0,      0,     2,      0,     0,      35,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Cameron Dicker" =>   [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      2,      0,       1,     3,   0      ],

        "Riley Patterson" =>  [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      1,      0,       0,     2,   0      ],
      },

      ["Seattle", "San Francisco", Time.utc(2023, 1, 15, 15, 30), 23, 41] => {
        #                          PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Noah Fant" =>           [ 0,     0,      0,     0,      0,     11,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],

        "Christian McCaffrey" => [ 0,     0,      1,     0,      0,     17,     119,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "George Kittle" =>       [ 0,     0,      0,     0,      0,     23,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Robbie Gould" =>        [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      3,      1,       0,     4,   0      ],
      },

      ["New York", "Minnesota", Time.utc(2023, 1, 15, 15, 30), 31, 24] => {
        #                       PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Saquon Barkley" =>   [ 0,     0,      0,     2,      0,     56,     53,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Graham Gano" =>      [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      1,      0,       0,     4,   0      ],

        "TJ Hockenson" =>     [ 0,     0,      0,     0,      0,     129,    0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Justin Jefferson" => [ 0,     0,      0,     0,      0,     47,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Greg Joseph" =>      [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      1,      0,       0,     3,   1      ],
      },

      ["Dallas", "Tampa Bay", Time.utc(2023, 1, 15, 15, 30), 31, 14] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Tony Pollard" =>   [ 0,     0,      0,     2,      0,     12,     77,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Cee Dee Lamb" =>   [ 0,     0,      1,     0,      0,     68,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Brett Maher" =>    [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      1,      0,       0,     4,   0      ],
      },

      ["Dallas", "San Francisco", Time.utc(2023, 1, 22, 15, 30), 12, 19] => {
        #                        PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Tony Pollard" =>        [ 0,     0,      0,     0,      0,     11,     22,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Cee Dee Lamb" =>        [ 0,     0,      0,     0,      0,     117,    0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Brett Maher" =>         [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      1,      1,       0,     0,   0      ],

        "Christian McCaffrey" => [ 0,     0,      0,     1,      0,     22,     35,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "George Kittle" =>       [ 0,     0,      0,     0,      0,     95,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Robbie Gould" =>        [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      2,      1,       1,     1,   0      ],
      },

      ["New York", "Philadelphia", Time.utc(2023, 1, 22, 15, 30), 31, 24] => {
        #                       PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Saquon Barkley" =>   [ 0,     0,      0,     0,      0,     21,     61,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Graham Gano" =>      [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      0,      0,       0,     1,   0      ],

        "Miles Sanders" =>    [ 0,     0,      0,     0,      0,     0,      90,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "AJ Brown" =>         [ 0,     0,      0,     0,      0,     47,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Dallas Goedert" =>   [ 0,     0,      1,     0,      0,     58,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Jalen Hurts" =>      [ 2,     0,      0,     0,      154,   0,      0,      0,     0,      0,      0,      1,      0,       0,     0,   1      ],
        "Jake Elliot" =>      [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      1,      0,       0,     5,   0      ],
      },

      ["Cincinatti", "Buffalo", Time.utc(2023, 1, 22, 11, 30), 27, 10] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Joe Burrow" =>     [ 1,     0,      0,     0,      242,   0,      31,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Joe Mixon" =>      [ 0,     0,      0,     1,      0,     18,     105,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Ja'marr Chase" =>  [ 0,     0,      1,     0,      0,     61,     3,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Evan McPherson" => [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      2,      0,       0,     3,   0      ],

        "Josh Allen" =>      [ 0,     1,      0,     0,      265,   0,      26,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "James Cook" =>      [ 0,     0,      0,     1,      0,     0,      13,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Stefon Diggs" =>    [ 0,     0,      0,     0,      0,     35,     0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Dawson Knox" =>     [ 0,     0,      1,     0,      0,     65,     0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Tyler Bass" =>      [ 0,     0,      0,     0,      0,     0,      0,     0,     0,      0,      0,      1,      0,       0,     1,   0      ],
      },

      ["Jacksonville", "Kansas City", Time.utc(2023, 1, 22, 15, 30), 30, 31] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Riley Patterson" =>  [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,       0,      2,       0,     2,   0      ],

        "Patrick Mahomes" =>  [ 2,     0,      0,     0,      195,   0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Travis Kelce" =>     [ 0,     0,      2,     0,      0,     98,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Harrison Butker" =>  [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      1,      0,       2,     3,   0      ],
      },
    }

    games.each do |opponents, scores|
      visitor, home, time, visitor_score, home_score = opponents
      home_team = NflTeam.find_by_name(home)
      visiting_team = NflTeam.find_by_name(visitor)
      players_and_stats = scores.map{|player, stats| [Player.find_by_name(player), stats]}

      if home_team.nil?
        puts "ERROR: wrong team name for home team: #{home}"
        next
      end

      if visiting_team.nil?
        puts "ERROR: wrong team name for visiting team: #{visitor}"
        next
      end

      if players_and_stats.select{|player, stats| player.nil? }.present?
        players = scores.select{|player, stats| Player.find_by_name(player).nil?}.map{|player, stats| player}
        puts "ERROR: wrong players #{players.join(', ')} name in game between #{home} and #{visitor}"
        next
      end

      game = Game.where(home_team: home_team, visiting_team: visiting_team).first
      if !game
        puts "creating game between: #{visitor} and #{home}"
        game = Game.create(home_team: home_team, visiting_team: visiting_team, game_time: time, home_team_score: home_score, visiting_team_score: visitor_score)
        players_and_stats.each do |player, stats|
          puts "creating stat for player #{player.name}"
          game.game_scores <<
            GameScore.create(
              passing_tds:      stats[0],
              passing_ints:     stats[1],
              receiving_tds:    stats[2],
              rushing_tds:      stats[3],
              yards_passing:    stats[4],
              yards_receiving:  stats[5],
              yards_rushing:    stats[6],
              fumbles:          stats[7],
              passing_2pt:      stats[8],
              receiving_2pt:    stats[9],
              rushing_2pt:      stats[10],
              fg_0_39:          stats[11],
              fg_40_49:         stats[12],
              fg_50_plus:       stats[13],
              ext_pt:           stats[14],
              fg_miss:          stats[15],

              game: game,
              player: player
            )
        end
      end
    end
  end
end
