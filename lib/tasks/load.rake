namespace :load do
  desc "load up fantasy teams"
  task :fantasy_teams => :environment do
    teams = {
=begin
        "Melanie" => {
            "QB"  => ["Matt Ryan",          "Atlanta"],
            "RB1" => ["Le'Veon Bell",       "Pittsburg"],
            "RB2" => ["LeGarrette Blount",  "New England"],
            "WR1" => ["Doug Baldwin",       "Seattle"],
            "WR2" => ["Michael Crabtree",   "Oakland"],
            "TE" =>  ["Jason Witten",       "Dallas"],
            "K" =>   ["Cairo Santos",       "Kansas City"],
            "SB-Score" => 48
        },

        "Steve" => {
            "QB"  => ["Aaron Rodgers",      "Green Bay"],
            "RB1" => ["Thomas Rawls",       "Seattle"],
            "RB2" => ["Jay Ajayi",          "Miami"],
            "WR1" => ["Julio Jones",        "Atlanta"],
            "WR2" => ["Antonio Brown",      "Pittsburg"],
            "TE" =>  ["Martellius Bennet",  "New England"],
            "K" =>   ["Cairo Santos",       "Kansas City"],
            "SB-Score" => 50
        },

        "Paul T" => {
            "QB"  => ["Tom Brady",          "New England"],
            "RB1" => ["Ezekiel Elliot",     "Dallas"],
            "RB2" => ["Lamar Miller",       "Houston"],
            "WR1" => ["Jordy Nelson",       "Green Bay"],
            "WR2" => ["Antonio Brown",      "Pittsburg"],
            "TE" =>  ["Travis Kelce",       "Kansas City"],
            "K" =>   ["Matt Bryant",        "Atlanta"],
            "SB-Score" => 49
        },

        "Roger" => {
            "QB"  => ["Matt Ryan",          "Atlanta"],
            "RB1" => ["Ezekiel Elliot",     "Dallas"],
            "RB2" => ["LeGarrette Blount",  "New England"],
            "WR1" => ["Odell Beckham Jr",   "New York"],
            "WR2" => ["Antonio Brown",      "Pittsburg"],
            "TE" =>  ["Travis Kelce",       "Kansas City"],
            "K" =>   ["Steve Hauschka",     "Seattle"],
            "SB-Score" => 48
        },

        "Paul D" => {
            "QB"  => ["Tom Brady",          "New England"],
            "RB1" => ["Le'Veon Bell",       "Pittsburg"],
            "RB2" => ["Ezekiel Elliot",     "Dallas"],
            "WR1" => ["Odell Beckham Jr",   "New York"],
            "WR2" => ["Jordy Nelson",       "Green Bay"],
            "TE" =>  ["Jimmy Graham",       "Seattle"],
            "K" =>   ["Matt Bryant",        "Atlanta"],
            "SB-Score" => 45
        },

        "Pat" => {
            "QB"  => ["Tom Brady",          "New England"],
            "RB1" => ["Le'Veon Bell",       "Pittsburg"],
            "RB2" => ["Ezekiel Elliot",     "Dallas"],
            "WR1" => ["Odell Beckham Jr",   "New York"],
            "WR2" => ["Julio Jones",        "Atlanta"],
            "TE" =>  ["Jared Cook",         "Green Bay"],
            "K" =>   ["Steve Hauschka",     "Seattle"],
            "SB-Score" => 54
        },

        "Greg" => {
            "QB"  => ["Tom Brady",          "New England"],
            "RB1" => ["Le'Veon Bell",       "Pittsburg"],
            "RB2" => ["Ezekiel Elliot",     "Dallas"],
            "WR1" => ["Odell Beckham Jr",   "New York"],
            "WR2" => ["Jordy Nelson",       "Green Bay"],
            "TE" =>  ["Travis Kelce",       "Kansas City"],
            "K" =>   ["Steve Hauschka",     "Seattle"],
            "SB-Score" => 61
        },
=end
        "Ron" => {
          "QB"  => ["Aaron Rodgers",      "Green Bay"],
          "RB1" => ["Ezekiel Elliot",     "Dallas"],
          "RB2" => ["LeGarrette Blount",  "New England"],
          "WR1" => ["Tyrel Hill",         "Kansas City"],
          "WR2" => ["Julio Jones",        "Atlanta"],
          "TE" =>  ["Jimmy Graham",       "Seattle"],
          "K" =>   ["Chris Boswell",      "Pittsburg"],
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
    if !NflTeam.find_by_name("Detroit")
      NflTeam.create(name: 'Detroit')
    end

    games = {
        ["Oakland", "Houston", Time.utc(2017, 1, 7, 3, 35), 14, 27] => {
            #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
            "Michael Crabtree" => [ 0,     0,      0,     0,     0,      33,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Lamar Miller" =>     [ 0,     0,      0,     1,     0,      0,      73,     0,     0,      0,      0,      0,      0,       0,     0,   0      ]
        },

        #                         PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        ["Detroit", "Seattle", Time.utc(2017, 1, 7, 7, 35), 6, 26] => {
            "Doug Baldwin" =>     [ 0,     0,      1,     0,     0,      104,    6,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Jimmy Graham" =>     [ 0,     0,      0,     0,     0,      37,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Steve Hauschka" =>   [ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      1,      1,       0,     2,   0      ],
            "Thomas Rawls" =>     [ 0,     0,      0,     1,     0,      33,     161,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        },

        #                         PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        ["Miami", "Pittsburg", Time.utc(2017, 1, 8, 12, 05), 12, 30] => {
            "Jay Ajayi" =>        [ 0,     0,      0,     0,     0,      12,     33,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],

            "Le'Veon Bell" =>     [ 0,     0,      0,     2,     0,      7,      167,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Antonio Brown" =>    [ 0,     0,      2,     0,     0,      0,      124,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Chris Boswell" =>    [ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      1,      0,       0,     3,   0      ]
        },

        #                         PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        ["New York", "Green Bay", Time.utc(2017, 1, 8, 15, 05), 13, 38] => {
            "Odell Beckham Jr" => [ 0,     0,      0,     0,     0,      28,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],

            "Aaron Rodgers" =>    [ 4,     0,      0,     0,     362,    0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Jared Cook" =>       [ 0,     0,      0,     0,     0,      48,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Chris Boswell" =>    [ 0,     0,      0,     0,     0,      13,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ]
        },

        #                         PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        ["Seattle", "Atlanta", Time.utc(2017, 1, 14, 15, 05), 13, 38] => {
            "Doug Baldwin" =>     [ 0,     0,      1,     0,     0,      80,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Jimmy Graham" =>     [ 0,     0,      1,     0,     0,      22,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Thomas Rawls" =>     [ 0,     0,      0,     0,     0,      0,      34,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Steve Hauschka" =>   [ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      2,      0,       0,     2,   0      ],

            "Matt Ryan" =>        [ 3,     0,      0,     0,     338,    0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Julio Jones" =>      [ 0,     0,      1,     0,     0,      67,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Matt Bryant" =>      [ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      2,      0,       0,     4,   0      ]
        },

        #                         PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        ["Houston", "New England", Time.utc(2017, 1, 14, 7, 35), 16, 34] => {
            #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
            "Lamar Miller" =>     [ 0,     0,      0,     0,     0,      16,     73,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],

            "Tom Brady" =>        [ 2,     2,      0,     0,     287,    0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Martellius Bennet" => [ 0,    0,      0,     0,     0,      4,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "LeGarrette Blount" => [ 0,    0,      0,     0,     0,      0,      31,     0,     0,      0,      0,      0,      0,       0,     0,   0      ]
        },

        #                         PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        ["Green Bay", "Dallas", Time.utc(2017, 1, 15, 15, 05), 34, 31] => {
            "Aaron Rodgers" =>    [ 2,     1,      0,     0,     356,    0,      16,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Jared Cook" =>       [ 0,     0,      1,     0,     0,      106,    0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],

            "Ezekiel Elliot" =>   [ 0,     0,      0,     0,     0,      0,      125,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Jason Witten" =>     [ 0,     0,      1,     0,     0,      59,     0,        0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        },

        #                         PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        ["Pittsburg", "Kansas City", Time.utc(2017, 1, 15, 19, 05), 18, 16] => {
            "Le'Veon Bell" =>     [ 0,     0,      0,     0,     0,      0,      170,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Antonio Brown" =>    [ 0,     0,      2,     0,     0,      108,    0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Chris Boswell" =>    [ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      3,      3,       0,     0,   0      ],

            "Travis Kelce" =>     [ 0,     0,      0,     0,     0,      77,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Tyrel Hill" =>       [ 0,     0,      0,     0,     0,      27,     18,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Cairo Santos" =>     [ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      0,      1,       0,     1,   0      ]
        },
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