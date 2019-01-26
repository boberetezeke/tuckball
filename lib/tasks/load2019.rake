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
        "Melanie" => {
            "QB"  => ["Patrick Mahomes",    "Kansas City"],
            "QBB" => ["Andrew Luck",        "Indianapolis"],
            "RB1" => ["Alvin Kamara",       "New Orleans"],
            "RB2" => ["Ezekiel Elliot",     "Dallas"],
            "RBB" => ["Melvin Gordon",      "San Diego"],
            "WR1" => ["Julian Edelman",     "New England"],
            "WR2" => ["Robert Woods",       "Los Angeles"],
            "WRB" => ["Tyreek Hill",        "Kansas City"],
            "TE" =>  ["Trey Burton",        "Chicago"],
            "TEB" => ["Ben Watson",         "New Orleans"],
            "K" =>   ["Ka'imi Fairbairn",   "Houston"],
            "KB" =>  ["Justin Tucker",      "Baltimore"],
        },

        "Steve" => {
            "QB"  => ["Patrick Mahomes",    "Kansas City"],
            "QBB" => ["Tom Brady",          "New England"],
            "RB1" => ["Chris Carson",       "Seattle"],
            "RB2" => ["Todd Gurley",        "Los Angeles"],
            "RBB" => ["Alvin Kamara",       "New Orleans"],
            "WR1" => ["Michael Thomas",     "New Orleans"],
            "WR2" => ["TY Hilton",          "Indianapolis"],
            "WRB" => ["DeAndre Hopkins",    "Houston"],
            "TE" =>  ["Gronkowski",         "New England"],
            "TEB" => ["Zach Ertz",          "Philadelphia"],
            "K" =>   ["Justin Tucker",      "Baltimore"],
            "KB" =>  ["Will Lutz",          "New Orleans"],
        },

        "Paul T" => {
            "QB"  => ["Patrick Mahomes",    "Kansas City"],
            "QBB" => ["Mitchell Trubisky",  "Chicago"],
            "RB1" => ["Jordan Howard",      "Chicago"],
            "RB2" => ["Lamar Miller",       "Houston"],
            "RBB" => ["Ezekiel Elliot",     "Dallas"],
            "WR1" => ["Julian Edelman",     "New England"],
            "WR2" => ["Keenan Allen",       "San Diego"],
            "WRB" => ["DeAndre Hopkins",    "Houston"],
            "TE" =>  ["Ben Watson",         "New Orleans"],
            "TEB" => ["Zach Ertz",          "Philadelphia"],
            "K" =>   ["Sebastian Janikowski", "Seattle"],
            "KB" =>  ["Justin Tucker",      "Baltimore"],
        },

        "Paul D" => {
          "QB"  => ["Patrick Mahomes",    "Kansas City"],
          "QBB" => ["Phillip Rivers",     "San Diego"],
          "RB1" => ["Ezekiel Elliot",     "Dallas"],
          "RB2" => ["Alvin Kamara",       "New Orleans"],
          "RBB" => ["Todd Gurley",            "Los Angeles"],
          "WR1" => ["DeAndre Hopkins",    "Houston"],
          #"WR2" => ["Tyreek Hill",            "Kansas City"],
          "WRB" => ["Julian Edelman",     "New England"],
          "TE" =>  ["Zach Ertz",          "Philadelphia"],
          "TEB" => ["Travis Kelce",         "Kansas City"],
          "K" =>   ["Stephen Gostokowski",  "New England"],
          "KB" =>  ["Harrison Butker",        "Kansas City"],
        },

        "Ron" => {
            "QB"  => ["Andrew Luck",            "Indianapolis"],
            "QBB"  => ["Patrick Mahomes",       "Kansas City"],
            "RB1" => ["Todd Gurley",            "Los Angeles"],
            "RB2" => ["Ezekiel Elliot",         "Dallas"],
            "RBB" => ["Jordan Howard",          "Chicago"],
            "WR1" => ["Michael Thomas",         "New Orleans"],
            # "WR2" => ["TY Hilton",              "Indianapolis"],
            "WRB" => ["Tyreek Hill",            "Kansas City"],
            "TE" =>  ["Gronkowski",             "New England"],
            "TEB" => ["Ben Watson",             "New Orleans"],
            "K" =>   ["Harrison Butker",        "Kansas City"],
            "KB" =>  ["Will Lutz",              "New Orleans"],
        },

        "Jeff" => {
            "QB"  => ["Drew Brees",           "New Orleans"],
            "QBB" => ["Tom Brady",            "New England"],
            "RB1" => ["Tarik Cohen",          "Chicago"],
            "RB2" => ["Ezekiel Elliot",       "Dallas"],
            "RBB" => ["Melvin Gordon",        "San Diego"],
            "WR1" => ["Robert Woods",         "Los Angeles"],
            "WR2" => ["DeAndre Hopkins",      "Houston"],
            "WRB" => ["Amare Cooper",         "Dallas"],
            "TE" =>  ["Travis Kelce",         "Kansas City"],
            "TEB" => ["Ben Watson",           "New Orleans"],
            "K" =>   ["Stephen Gostokowski",  "New England"],
            "KB" =>  ["Sebastian Janikowski", "Seattle"],
        },

        "Greg" => {
            "QB"  => ["Lamar Jackson",    "Baltimore"],
            "QBB"  =>["Drew Brees",       "New Orleans"],
            "RB1" => ["Alvin Kamara",     "New Orleans"],
            "RB2" => ["Chris Carson",     "Seattle"],
            "RBB" => ["Ezekiel Elliot",   "Dallas"],
            "WR1" => ["Tyreek Hill",      "Kansas City"],
            "WR2" => ["DeAndre Hopkins",  "Houston"],
            "WRB" => ["Michael Thomas",   "New Orleans"],
            "TE" =>  ["Eric Ebron",       "Indianapolis"],
            "TEB" => ["Travis Kelce",     "Kansas City"],
            "K" =>   ["Cody Parkey",      "Chicago"],
            "KB" =>  ["Will Lutz",        "New Orleans"],
        },

        "Gordy" => {
            "QB"  => ["Patrick Mahomes",      "Kansas City"],
            "QBB"  =>["Drew Brees",           "New Orleans"],
            "RB1" => ["Todd Gurley",          "Los Angeles"],
            "RB2" => ["Ezekiel Elliot",       "Dallas"],
            "RBB" => ["Melvin Gordon",        "San Diego"],
            "WR1" => ["TY Hilton",            "Indianapolis"],
            "WR2" => ["Michael Thomas",       "New Orleans"],
            "WRB" => ["DeAndre Hopkins",      "Houston"],
            "TE" =>  ["Zach Ertz",            "Philadelphia"],
            "TEB" => ["Trey Burton",          "Chicago"],
            "K" =>   ["Cody Parkey",          "Chicago"],
            "KB" =>  ["Stephen Gostokowski",  "New England"],
        }
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
  end


  desc "load up games"
  task :games => :environment do
    games = {
        ["Indianapolis", "Houston", Time.utc(2019, 1, 5, 15, 35), 21, 7] => {
            #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
            "Andrew Luck" =>      [ 2,     1,      0,     0,     222,     0,     29,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "TY Hilton" =>        [ 0,     0,      0,     0,     0,      38,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Eric Ebron" =>       [ 0,     0,      1,     0,     0,      26,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "DeAndre Hopkins" =>  [ 0,     0,      0,     0,     0,      37,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Lamar Miller" =>     [ 0,     0,      0,     0,     0,      63,     18,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
            "Ka'imi Fairbairn" => [ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      0,      0,       0,     1,   0      ]
        },

        ["Seattle", "Dallas", Time.utc(2019, 1, 5, 19, 35), 22, 24] => {
          #                         PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
          "Chris Carson" =>          [ 0,     0,      0,     0,     0,      0,      20,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Sebastian Janikowski" =>  [ 0,     0,      0,     0,     0,      0,      0,     0,     0,      0,      0,      1,      1,       0,     0,   0      ],
          "Ezekiel Elliot" =>        [ 0,     0,      0,     1,     0,      32,     137,   0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Amare Cooper" =>          [ 0,     0,      0,     0,     0,      106,    0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],

        },

        ["San Diego", "Baltimore", Time.utc(2019, 1, 6, 12, 05), 23, 17] => {
        #                         PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Phillip Rivers" =>     [ 0,     0,      0,     0,     160,     0,     15,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Keenan Allen" =>       [ 0,     0,      0,     0,     0,      37,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Melvin Gordon" =>      [ 0,     0,      0,     1,     0,      0,      40,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Lamar Jackson" =>      [ 2,     1,      0,     0,     194,    0,      54,     1,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Justin Tucker" =>      [ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      0,      0,       0,     2,   0      ],
        },

        ["Philadelphia", "Chicago", Time.utc(2019, 1, 6, 15, 35), 22, 21] => {
          #                         PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
          "Zach Ertz" =>          [ 0,     0,      0,     0,     0,      52,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Mitchell Trubisky" =>   [ 1,     0,      0,     0,    303,    0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Tarik Cohen" =>        [ 0,     0,      0,     0,     0,      27,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Jordan Howard" =>      [ 0,     0,      0,     0,     0,      0,      35,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Trey Burton" =>        [ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Cody Parkey" =>        [ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      3,      0,       0,     0,   1      ],
        },

        ["Indianapolis", "Kansas City", Time.utc(2019, 1, 12, 3, 35), 13, 31] => {
          #                         PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
          "Andrew Luck" =>        [ 1,     0,      0,     0,     203,     0,     17,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "TY Hilton" =>          [ 0,     0,      1,     0,     0,      60,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Eric Ebron" =>         [ 0,     0,      0,     0,     0,      51,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Patrick Mahomes" =>    [ 0,     0,      0,     1,     278,    0,      8,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Tyreek Hill" =>        [ 0,     0,      0,     1,     0,      72,     36,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Travis Kelce" =>       [ 0,     0,      0,     0,     0,      108,    0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Harrison Butker" =>    [ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      1,      0,       0,     4,   0      ],
        },

        ["Dallas", "Los Angeles", Time.utc(2019, 1, 12, 19, 35), 22, 30] => {
          #                         PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
          "Ezekiel Elliot" =>     [ 0,     0,      0,     1,     0,      19,     47,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Amare Cooper" =>       [ 0,     0,      1,     0,     0,      65,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Robert Woods" =>       [ 0,     0,      0,     0,     0,      69,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Todd Gurley" =>        [ 0,     0,      0,     1,     0,      3,      115,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        },

        ["San Diego", "New England", Time.utc(2019, 1, 13, 12, 15), 28, 41] => {
          #                         PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
          "Phillip Rivers" =>     [ 3,     1,      0,     0,     331,    0,      15,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Keenan Allen" =>       [ 0,     0,      1,     0,     0,      75,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Melvin Gordon" =>      [ 0,     0,      0,     1,     0,      11,     15,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Tom Brady" =>          [ 1,     0,      0,     0,     343,    0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Gronkowski" =>         [ 0,     0,      0,     0,     0,      25,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Julian Edelman" =>     [ 0,     0,      0,     1,     0,      151,    0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Stephen Gostokowski" =>[ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      2,      0,       0,     5,   0      ],
        },

        ["Philadelphia", "New Orleans", Time.utc(2019, 1, 13, 15, 15), 14, 20] => {
          #                         PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
          "Zach Ertz" =>          [ 0,     0,      0,     0,     0,      50,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Drew Brees" =>         [ 2,     1,      0,     0,     301,    0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Alvin Kamara" =>       [ 0,     0,      0,     0,     0,      23,     71,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Michael Thomas" =>     [ 0,     0,      1,     0,     0,      171,    0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Ben Watson" =>         [ 0,     0,      0,     0,     0,      12,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Will Lutz" =>          [ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      1,      1,       0,     2,   1      ],
        },
        ["New England", "Kansas City", Time.utc(2019, 1, 20, 19, 15), 37, 31] => {
          #                         PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
          "Patrick Mahomes" =>    [ 3,     0,      0,     0,     295,    0,      11,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Tyreek Hill" =>        [ 0,     0,      0,     0,     0,      42,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Travis Kelce" =>       [ 0,     0,      1,     0,     0,      23,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Harrison Butker" =>    [ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      1,      0,       0,     4,   0      ],
          "Tom Brady" =>          [ 1,     2,      0,     0,     348,    0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Gronkowski" =>         [ 0,     0,      0,     0,     0,      79,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Julian Edelman" =>     [ 0,     0,      0,     1,     0,      96,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Stephen Gostokowski" =>[ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      0,      1,       0,     4,   0      ],
        },

        ["Los Angeles", "New Orleans", Time.utc(2019, 1, 20, 15, 15), 14, 20] => {
          #                         PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
          "Robert Woods" =>       [ 0,     0,      0,     0,     0,      33,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Todd Gurley" =>        [ 0,     0,      0,     1,     0,      3,      10,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Drew Brees" =>         [ 2,     1,      0,     0,     249,    0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Alvin Kamara" =>       [ 0,     0,      0,     0,     0,      96,     15,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Michael Thomas" =>     [ 0,     0,      0,     0,     0,      36,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Ben Watson" =>         [ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
          "Will Lutz" =>          [ 0,     0,      0,     0,     0,      0,      0,      0,     0,      0,      0,      3,      0,       0,     2,   0      ],
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
