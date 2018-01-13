namespace :load do
  desc "load up fantasy teams"
  task :fantasy_teams => :environment do
    teams = {
        "Melanie" => {
            "QB"  => ["Ben Roethlisberger", "Pittsburg"],
            "RB1" => ["Christian McCaffery","Carolina"],
            "RB2" => ["Devonte Freeman",    "Atlanta"],
            "WR1" => ["Stefon Diggs",       "Minnesota"],
            "WR2" => ["Michael Thomas",     "New Orleans"],
            "TE" =>  ["Rob Gronkowski",     "New England"],
            "K" =>   ["Josh Lambo",         "Jacksonville"],
            "SB-Score" => 30
        },

        "Steve" => {
            "QB"  => ["Ben Roethlisberger", "Pittsburg"],
            "RB1" => ["Todd Gurley",        "Los Angeles"],
            "RB2" => ["Kareem Hunt",        "Kansas City"],
            "WR1" => ["Stefon Diggs",       "Minnesota"],
            "WR2" => ["Michael Thomas",     "New Orleans"],
            "TE" =>  ["Rob Gronkowski",     "New England"],
            "K" =>   ["Matt Bryant",        "Atlanta"],
            "SB-Score" => 56
        },

        "Roger" => {
            "QB"  => ["Drew Brees",         "New Orleans"],
            "RB1" => ["Latavius Murray",    "Minnesota"],
            "RB2" => ["Todd Gurley",        "Los Angeles"],
            "WR1" => ["Tyreek Hill",        "Kansas City"],
            "WR2" => ["Antonio Brown",      "Pittsburg"],
            "TE" =>  ["Rob Gronkowski",     "New England"],
            "K" =>   ["Ryan Sucoop",        "Tennessee"],
            "SB-Score" => 00
        },

        "Paul" => {
            "QB"  => ["Jared Goff",         "Los Angeles"],
            "RB1" => ["Alvin Kamara",       "New Orleans"],
            "RB2" => ["Leonard Fournette",  "Jacksonville"],
            "WR1" => ["Adam Thielan",       "Minnesota"],
            "WR2" => ["Julio Jones",        "Atlanta"],
            "TE" =>  ["Travis Kelce",       "Kansas City"],
            "K" =>   ["Gostokowski",        "New England"],
            "SB-Score" => 63
        },

        "Jeff" => {
            "QB"  => ["Drew Brees",         "New Orleans"],
            "RB1" => ["Todd Gurley",        "Los Angeles"],
            "RB2" => ["Jay Ajai",           "Philadelphia"],
            "WR1" => ["Juju Smith Schuster", "Pittsburg"],
            "WR2" => ["Adam Thielan",       "Minnesota"],
            "TE" =>  ["Travis Kelce",       "Kansas City"],
            "K" =>   ["Josh Lambo",         "Jacksonville"],
            "SB-Score" => 00
        },

        "Greg" => {
            "QB"  => ["Drew Brees",         "New Orleans"],
            "RB1" => ["Todd Gurley",        "Los Angeles"],
            "RB2" => ["Le'Veon Bell",       "Pittsburg"],
            "WR1" => ["Tyreek Hill",        "Kansas City"],
            "WR2" => ["Julio Jones",        "Atlanta"],
            "TE" =>  ["Rob Gronkowski",     "New England"],
            "K" =>   ["Kai Forbath",        "Minnesota"],
            "SB-Score" => 56
        },

        "Gordy" => {
            "QB"  => ["Drew Brees",         "New Orleans"],
            "RB1" => ["Todd Gurley",        "Los Angeles"],
            "RB2" => ["Deon Lewis",         "New England"],
            "WR1" => ["Antonio Brown",      "Pittsburg"],
            "WR2" => ["Julio Jones",        "Atlanta"],
            "TE" =>  ["Travis Kelce",       "Kansas City"],
            "K" =>   ["Kai Forbath",        "Minnesota"],
            "SB-Score" => 45
        }
    }


    teams.each do |person, team|
      fantasy_team = FantasyTeam.create(name: person)

      team.each do |pos, (player_name, team_name)|
        next if pos == "SB-Score"

        pos = "WR" if pos == "WR1" || pos == "WR2"
        pos = "RB" if pos == "RB1" || pos == "RB2"
        player = Player.find_or_create_by(name: player_name, position: pos)
        fantasy_team.players << player

        nfl_team = NflTeam.find_or_create_by(name: team_name)
        nfl_team.players << player
      end
    end
  end

  desc "load up games"
  task :games => :environment do
    if !NflTeam.find_by_name("Buffalo")
      NflTeam.create(name: 'Buffalo')
    end

    games = {
        ["Buffalo", "Jacksonville", Time.utc(2018, 1, 7, 12, 05), 3, 10] => {
            #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
            "Josh Lambo" =>       [ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      0,      1,       0,     1,   0      ],
            "Leonard Fournette" =>[ 0,     0,      0,     0,     0,      21,     56,     0,     0,      0,      0,      0,      0,       0,     0,   0      ]
        },

        ["Tennessee", "Kansas City", Time.utc(2018, 1, 6, 3, 35), 22, 21] => {
        #                         PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
            "Kareem Hunt" =>      [ 0,     0,      0,     1,     0,      5,      42,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Travis Kelce" =>     [ 0,     0,      1,     0,     0,      66,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Tyreek Hill" =>      [ 0,     0,      1,     0,     0,      87,     14,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],


            "Ryan Sucoop" =>      [ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      0,      1,       0,     1,   0      ],
        },

        ["Atlanta", "Los Angeles", Time.utc(2018, 1, 6, 7, 35), 26, 13] => {
        #                         PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
            "Devonte Freeman" =>  [ 0,     0,      0,     1,     0,      3,      66,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Julio Jones" =>      [ 0,     0,      1,     0,     0,      94,     13,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Matt Bryant" =>      [ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      2,      0,       2,     2,   0      ],

            "Jared Goff" =>       [ 1,     0,      0,     0,     259,    0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Todd Gurley" =>      [ 0,     0,      0,     1,     0,      10,     101,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        },

        ["Carolina", "New Orleans", Time.utc(2018, 1, 7, 3, 35), 26, 31] => {
        #                         PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
            "Christian McCaffery" =>[ 0,   0,      1,     0,     0,      101,    16,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],

            "Drew Brees" =>       [ 2,     0,      0,     0,     376,    0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Alvin Kamara" =>     [ 0,     0,      0,     1,     0,      10,     23,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Michael Thomas" =>   [ 0,     0,      0,     0,     0,      131,    0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        }
    }

    games.each do |opponents, scores|
      visitor, home, time, visitor_score, home_score = opponents
      home_team = NflTeam.find_by_name(home)
      visiting_team = NflTeam.find_by_name(visitor)
      players_and_stats = scores.map{|player, stats| [Player.find_by_name(player), stats]}

      if home_team.nil?
        puts "wrong team name for home team: #{home}"
        next
      end

      if visiting_team.nil?
        puts "wrong team name for visiting team: #{visitor}"
        next
      end

      if players_and_stats.select{|player, stats| player.nil? }.present?
        puts "wrong player name in game between #{home} and #{visitor}"
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
