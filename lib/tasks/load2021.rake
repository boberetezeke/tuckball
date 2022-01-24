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
      "Steve" => {
        "QB"  => ["Tom Brady",          "Tampa Bay"],
        "QBB" => ["Joe Burrow",         "Cincinatti"],
        "RB1" => ["Aaron Jones",        "Green Bay"],
        "RB2" => ["Joe Mixon",          "Cincinatti"],
        "RBB" => ["Leonard Fournette",  "Tampa Bay"],
        "WR1" => ["Stefon Diggs",       "Buffalo"],
        "WR2" => ["Deebo Samuel",       "San Francisco"],
        "WRB" => ["Jamar Chase",        "Cincinatti"],
        "TE" =>  ["Travis Kelce",       "Kansas City"],
        "TEB" => ["Rob Gronkowski",     "Tampa Bay"],
        "K" =>   ["Greg Zuerlein",      "Dallas"],
        "KB" =>  ["Harrison Butker",    "Kansas City"],
      },

      "Greg" => {
        "QB"  => ["Tom Brady",          "Tampa Bay"],
        "QBB"  => ["Patrick Mahomes",    "Kansas City"],
        "RB1" => ["Joe Mixon",          "Cincinatti"],
        "RB2" => ["Devin Singletary",   "Buffalo"],
        "RBB" => ["Leonard Fournette",  "Tampa Bay"],
        "WR1" => ["Devante Adams",      "Green Bay"],
        "WR2" => ["Cooper Kupp",        "Los Angeles"],
        "WRB" => ["Mike Evans",         "Tampa Bay"],
        "TE" =>  ["Travis Kelce",       "Kansas City"],
        "TEB" => ["Rob Gronkowski",     "Tampa Bay"],
        "K" =>   ["Greg Zuerlein",      "Dallas"],
        "KB" =>  ["Ryan Succop",        "Tampa Bay"],
      },

      "John" => {
        "QB"  => ["Patrick Mahomes",    "Kansas City"],
        "QBB"  => ["Tom Brady",         "Tampa Bay"],
        "RB1" => ["Ezekeil Elliot",     "Dallas"],
        "RB2" => ["Leonard Fournette",  "Tampa Bay"],
        "RBB" => ["Devin Singletary",   "Buffalo"],
        "WR1" => ["Devante Adams",      "Green Bay"],
        "WR2" => ["Cooper Kupp",        "Los Angeles"],
        "WRB" => ["Mike Evans",         "Tampa Bay"],
        "TE" =>  ["Dawson Knox",        "Buffalo"],
        "TEB" => ["Travis Kelce",       "Kansas City"],
        "K" =>   ["Matt Prater",        "Arizona"],
        "KB" =>  ["Ryan Succop",        "Tampa Bay"],
      },

      "Pat" => {
        "QB"  => ["Josh Allen",         "Buffalo"],
        "QBB" => ["Aaron Rodgers",      "Green Bay"],
        "RB1" => ["Joe Mixon",          "Cincinatti"],
        "RB2" => ["Miles Sanders",      "Philadelphia"],
        "RBB" => ["Najee Harris",       "Pittsburg"],
        "WR1" => ["Amari Cooper",       "Dallas"],
        "WR2" => ["Deebo Samuel",       "San Francisco"],
        "WRB" => ["AJ Brown",           "Tennessee"],
        "TE" =>  ["Travis Kelce",       "Kansas City"],
        "TEB" => ["Zach Ertz",          "Arizona"],
        "K" =>   ["Daniel Carlson",     "Las Vegas"],
        "KB" =>  ["Nick Folk",          "New England"],
      },

      "Gordy" => {
        "QB" => ["Patrick Mahomes",     "Kansas City"],
        "QBB" => ["Aaron Rodgers",      "Green Bay"],
        "RB1" => ["Devin Singletary",   "Buffalo"],
        "RB2" => ["Derrick Henry",      "Tennessee"],
        "RBB" => ["Ezekeil Elliot",     "Dallas"],
        "WR1" => ["Devante Adams",      "Green Bay"],
        "WR2" => ["Cooper Kupp",        "Los Angeles"],
        "WRB" => ["Tyrek Hill",         "Kansas City"],
        "TE" => ["Dalton Schultz",      "Dallas"],
        "TEB" => ["Travis Kelce",       "Kansas City"],
        "K" =>  ["Evan McPherson",      "Cincinatti"],
        "KB" => ["Mason Crosby",        "Green Bay"],
      },

      "Roger" => {
        "QB"  => ["Dak Prescott",       "Dallas"],
        "QBB"  => ["Josh Allen",        "Buffalo"],
        "RB1" => ["Najee Harris",       "Pittsburg"],
        "RB2" => ["Derrick Henry",      "Tennessee"],
        "RBB" => ["Ezekeil Elliot",     "Dallas"],
        "WR1" => ["Devante Adams",      "Green Bay"],
        "WR2" => ["Cooper Kupp",        "Los Angeles"],
        "WRB" => ["CeeDee Lamb",        "Dallas"],
        "TE" => ["Rob Gronkowski",      "Tampa Bay"],
        "TEB" =>  ["Travis Kelce",      "Kansas City"],
        "K" =>   ["Robbie Gould",       "San Francisco"],
        "KB" =>  ["Greg Zuerlein",      "Dallas"],
      },

      "Ron" => {
        "QB"  => ["Tom Brady",           "Tampa Bay"],
        "QBB"  => ["Ryan Tannehill",     "Tennessee"],
        "RB1" => ["Ezekeil Elliot",      "Dallas"],
        "RB2" => ["Derrick Henry",       "Tennessee"],
        "RBB" => ["Joe Mixon",           "Cincinatti"],
        "WR1" => ["Devante Adams",       "Green Bay"],
        "WR2" => ["Cooper Kupp",         "Los Angeles"],
        "WRB" => ["Deebo Samuel",        "San Francisco"],
        "TE" =>  ["Travis Kelce",        "Kansas City"],
        "TEB" => ["Zach Ertz",           "Arizona"],
        "K" =>   ["Tyler Bass",          "Buffalo"],
        "KB" =>   ["Daniel Carlson",     "Las Vegas"],
      },

      "Melanie" => {
        "QB" => ["Patrick Mahomes",     "Kansas City"],
        "QBB" => ["Aaron Rodgers",      "Green Bay"],
        "RB1" => ["Ezekeil Elliot",     "Dallas"],
        "RB2" => ["Sony Michel",        "Los Angeles"],
        "RBB" => ["Derrick Henry",      "Tennessee"],
        "WR1" => ["Jamar Chase",        "Cincinatti"],
        "WR2" => ["Stefon Diggs",       "Buffalo"],
        "WRB" => ["Tyrek Hill",         "Kansas City"],
        "TE" => ["Rob Gronkowski",      "Tampa Bay"],
        "TEB" => ["Dalton Schultz",     "Dallas"],
        "K" =>   ["Chris Boswell",      "Pittsburg"],
        "KB" =>  ["Nick Folk",          "New England"],
      },
    }

    injuries = {
      "Leonard Fournette" => [1]
    }

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
      ["Las Vegas", "Cincinatti", Time.utc(2022, 1, 15, 15, 30), 19, 26] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Daniel Carlson" => [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      3,      1,       0,     1,   0      ],

        "Joe Burrow" =>     [ 2,     0,      0,     0,      244,   0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Joe Mixon" =>      [ 0,     0,      0,     0,      0,     28,     48,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Jamar Chase" =>    [ 0,     0,      0,     0,      0,     116,    0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Evan McPherson" => [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      3,      1,       0,     2,   0      ],
      },

      ["New England", "Buffalo", Time.utc(2022, 1, 15, 19, 00), 17, 47] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Nick Folk" =>      [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      0,      1,       0,     2,   0      ],

        "Josh Allen" =>     [ 5,     0,      0,     0,      308,   0,      66,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Devin Singletary" => [ 0,   0,      0,     2,      0,     13,     81,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Stefon Diggs" =>   [ 0,     0,      0,     0,      0,     60,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Dawson Knox" =>    [ 0,     0,      2,     0,      0,     89,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Tyler Bass" =>     [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      0,      0,       0,     5,   0      ],
      },

      ["Philadelphia", "Tampa Bay", Time.utc(2022, 1, 16, 12, 00), 15, 31] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Miles Sanders" => [  0,     0,      0,     0,      0,     16,     12,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],

        "Tom Brady" =>     [ 2,     0,      0,     0,      271,   0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Leonard Fournette" => [ 0, 0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Mike Evans" =>   [ 0,      0,      1,     0,      0,     117,    0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Rob Gronkowski" => [ 0,    0,      1,     0,      0,     31,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Ryan Succop" =>  [ 0,      0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      1,      0,       0,     4,   0      ],
      },

      ["San Francisco", "Dallas", Time.utc(2022, 1, 16, 15, 00), 23, 17] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Deebo Samuel" =>   [ 0,      0,      0,     1,      0,     38,     72,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Robbie Gould" =>   [ 0,      0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      0,      1,       2,     2,   0      ],

        "Dak Prescott" =>   [ 1,      1,      0,     0,      254,   0,      27,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Ezekeil Elliot" => [ 0,      0,      0,     0,      0,     0,      31,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Amari Cooper" =>   [ 0,      0,      1,     0,      0,     64,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "CeeDee Lamb" =>    [ 0,      0,      0,     0,      0,     21,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Dalton Schultz" => [ 0,      0,      0,     0,      0,     89,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Greg Zuerlein" =>  [ 0,      0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      0,      0,       1,     2,   0      ],
      },

      ["Pittsburg", "Kansas City", Time.utc(2022, 1, 16, 19, 00), 21, 42] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Najee Harris" =>    [ 0,      0,      0,     0,      0,     0,      29,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Chris Boswell" =>   [ 0,      0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      0,      0,       0,     3,   0      ],

        "Patrick Mahomes" => [ 5,      1,      0,     0,      404,   0,      66,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Tyrek Hill" =>     [  0,      0,      1,     0,      0,     57,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Travis Kelce" =>   [  1,      0,      1,     0,      2,     108,    0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Harrison Butker" =>  [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      0,      0,       0,     6,   0      ],
      },

      ["Arizona", "Los Angeles", Time.utc(2022, 1, 17, 19, 00), 11, 34] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Zach Ertz" =>    [ 0,      0,      0,     0,      0,     21,     0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Matt Prater" =>  [ 0,      0,      0,     0,      0,     0,      0,     0,     0,      0,      0,      0,      0,       0,     1,   0      ],

        "Sony Michel" =>  [  0,      0,      0,     0,      0,     0,     58,      0,     0,      0,      0,      0,      0,       0,     0,   0    ],
        "Cooper Kupp" =>  [  0,      0,      1,     0,      0,     61,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0    ],
      },

      ["Cincinatti", "Tennessee", Time.utc(2022, 1, 22, 15, 30), 19, 16] => {
        #                   PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Derrick Henry" => [ 0,      0,      0,     0,      0,     0,      62,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "AJ Brown" =>      [ 0,      0,      1,     0,      0,     142,    0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],

        "Joe Burrow" =>     [ 0,     1,      0,     0,      348,   0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Joe Mixon" =>      [ 0,     0,      0,     1,      0,     51,     54,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Jamar Chase" =>    [ 0,     0,      0,     0,      0,     109,    0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Evan McPherson" => [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      1,      1,       2,     1,   0      ],
      },

      ["San Francisco", "Green Bay", Time.utc(2022, 1, 22, 19, 30), 13, 10] => {
        #                   PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Deebo Samuel" =>   [ 0,      0,      0,     1,      0,     44,     39,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Robbie Gould" =>   [ 0,      0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      1,      1,       0,     1,   0      ],

        "Aaron Rodgers" =>  [ 0,     0,      0,     0,      225,   0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Aaron Jones" =>    [ 0,     0,      0,     0,      0,     129,    41,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Devante Adams" =>  [ 0,     0,      0,     1,      0,     90,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Mason Crosby" =>   [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      1,      0,       0,     1,   0      ],
      },

      ["Los Angeles", "Tampa Bay", Time.utc(2022, 1, 23, 14, 00), 30, 27] => {
        #                   PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Sony Michel" =>  [  0,     0,      0,     0,      0,     0,      4,      0,     0,      0,      0,      0,      0,       0,     0,   0    ],
        "Cooper Kupp" =>  [  0,     0,      1,     0,      0,     183,    0,      0,     0,      0,      0,      0,      0,       0,     0,   0    ],

        "Tom Brady" =>     [ 1,     1,      0,     0,      329,   0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Leonard Fournette" => [ 0, 0,      0,     2,      0,     0,      51,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Mike Evans" =>   [ 0,      0,      1,     0,      0,     119,    0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Rob Gronkowski" => [ 0,    0,      0,     0,      0,     42,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Ryan Succop" =>  [ 0,      0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      1,      1,       0,     3,   1      ],
      },

      ["Buffalo", "Kansas City", Time.utc(2022, 1, 23, 17, 00), 36, 42] => {
        #                   PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Josh Allen" =>     [ 4,     0,      0,     0,      329,   0,      68,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Devin Singletary" => [ 0,   0,      0,     1,      0,     25,     26,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Stefon Diggs" =>   [ 0,     0,      0,     0,      0,     7,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Dawson Knox" =>    [ 0,     0,      0,     0,      0,     9,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Tyler Bass" =>     [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      0,      0,       0,     4,   0      ],

        "Patrick Mahomes" => [ 3,      0,      0,     0,    378,   0,      69,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Tyrek Hill" =>     [  0,      0,      1,     0,    0,     150,    0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Travis Kelce" =>   [  1,      0,      1,     0,    0,     96,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Harrison Butker" =>  [ 0,     0,      0,     0,    0,     0,      0,      0,     0,      0,      0,      1,      2,       0,     3,   0      ],
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
