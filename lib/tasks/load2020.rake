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
        "QB"  => ["Josh Allen",         "Buffalo"],
        "QBB" => ["Patrick Mahomes",    "Kansas City"],
        "RB1" => ["Derrick Henry",      "Tennessee"],
        "RB2" => ["Jonathon Taylor",    "Indianapolis"],
        "RBB" => ["Alvin Kamara",       "New Orleans"],
        "WR1" => ["Chris Godwin",       "Tampa Bay"],
        "WR2" => ["DK Metcalf",         "Seattle"],
        "WRB" => ["AJ Brown",           "Tennessee"],
        "TE" =>  ["Mark Andrews",       "Baltimore"],
        "TEB" => ["Travis Kelce",       "Kansas City"],
        "K" =>   ["Harrison Butker",    "Kansas City"],
        "KB" =>  ["Justin Tucker",      "Baltimore"],
      },

      "Ron" => {
        "QB"  => ["Patrick Mahomes",    "Kansas City"],
        "QBB" => ["Aaron Rodgers",      "Green Bay"],
        "RB1" => ["Alvin Kamara",       "New Orleans"],
        "RB2" => ["Nick Chubb",         "Cleveland"],
        "RBB" => ["Aaron Jones",        "Green Bay"],
        "WR1" => ["Devante Adams",      "Green Bay"],
        "WR2" => ["Stefon Diggs",       "Buffalo"],
        "WRB" => ["Tyrek Hill",         "Kansas City"],
        "TE" =>  ["Mark Andrews",       "Baltimore"],
        "TEB" => ["Travis Kelce",       "Kansas City"],
        "K" =>   ["Jason Meyers",       "Seattle"],
        "KB" =>  ["Tyler Bass",         "Buffalo"],
      },

      "Gordy" => {
        "QB"  => ["Patrick Mahomes",    "Kansas City"],
        "QBB" => ["Lamar Jackson",      "Baltimore"],
        "RB1" => ["Derrick Henry",      "Tennessee"],
        "RB2" => ["JK Dobbins",         "Baltimore"],
        "RBB" => ["Alvin Kamara",       "New Orleans"],
        "WR1" => ["Stefon Diggs",       "Buffalo"],
        "WR2" => ["Devante Adams",      "Green Bay"],
        "WRB" => ["Tyrek Hill",         "Kansas City"],
        "TE" =>  ["Eric Ebron",         "Pittsburg"],
        "TEB" => ["Travis Kelce",       "Kansas City"],
        "K" =>   ["Will Lutz",          "New Orleans"],
        "KB" =>  ["Harrison Butker",    "Kansas City"],
      },

      "Roger" => {
        "QB"  => ["Josh Allen",         "Buffalo"],
        "QBB" => ["Aaron Rodgers",      "Green Bay"],
        "RB1" => ["Aaron Jones",        "Green Bay"],
        "RB2" => ["Alvin Kamara",       "New Orleans"],
        "RBB" => ["Derrick Henry",      "Tennessee"],
        "WR1" => ["DK Metcalf",         "Seattle"],
        "WR2" => ["AJ Brown",           "Tennessee"],
        "WRB" => ["Devante Adams",      "Green Bay"],
        "TE" =>  ["Travis Kelce",       "Kansas City"],
        "TEB" => ["Robert Tonyan",      "Green Bay"],
        "K" =>   ["Rodrigo Blankenship","Indianapolis"],
        "KB" =>  ["Tyler Bass",         "Buffalo"],
      },

      "David" => {
        "QB"  => ["Tom Brady",             "Tampa Bay"],
        "QBB" => ["Patrick Mahomes",       "Kansas City"],
        "RB1" => ["Jonathon Taylor",       "Indianapolis"],
        "RB2" => ["Derrick Henry",         "Tennessee"],
        "RBB" => ["Nick Chubb",            "Cleveland"],
        "WR1" => ["Stefon Diggs",         "Buffalo"],
        "WR2" => ["Devante Adams",         "Green Bay"],
        "WRB" => ["DK Metcalf",            "Seattle"],
        "TE" =>  ["Travis Kelce",          "Kansas City"],
        "TEB" => ["Rob Gronkowski",        "Tampa Bay"],
        "K" =>   ["Rodrigo Blankenship",   "Indianapolis"],
        "KB" =>  ["Cairo Santos",          "Chicago Bears"],
      },

      "Pat" => {
        "QB"  => ["Aaron Rodgers",         "Green Bay"],
        "QBB" => ["Baker Mayfield",        "Cleveland"],
        "RB1" => ["Jonathon Taylor",       "Indianopolis"],
        "RB2" => ["Alvin Kamara",          "New Orleans"],
        "RBB" => ["Derrick Henry",         "Tennessee"],
        "WR1" => ["Mike Evans",            "Tampa Bay"],
        "WR2" => ["DK Metcalf",            "Seattle"],
        "WRB" => ["Tyrek Hill",            "Kansas City"],
        "TE" =>  ["Travis Kelce",          "Kansas City"],
        "TEB" => ["Mark Andrews",          "Baltimore"],
        "K" =>   ["Matt Gay",              "Los Angeles"],
        "KB" =>  ["Jason Myers",           "Seattle"],
      },

      "Steve" => {
        "QB"  => ["Aaron Rodgers",         "Green Bay"],
        "QBB" => ["Lamar Jackson",         "Baltimore"],
        "RB1" => ["Alvin Kamara",          "New Orleans"],
        "RB2" => ["Nick Chubb",            "Cleveland"],
        "RBB" => ["Chris Carson",          "Seattle"],
        "WR1" => ["Stefon Diggs",          "Buffalo"],
        "WR2" => ["DK Metcalf",            "Seattle"],
        "WRB" => ["Devante Adams",         "Green Bay"],
        "TE" =>  ["Travis Kelce",          "Kansas City"],
        "TEB" => ["Robert Tonyan",         "Green Bay"],
        "K" =>   ["Justin Tucker",         "Baltimore"],
        "KB" =>  ["Harrison Butker",       "Kansas City"],
      },

      "Greg" => {
        "QB"  => ["Josh Allen",               "Buffalo"],
        "QBB" => ["Aaron Rodgers",            "Green Bay"],
        "RB1" => ["Alvin Kamara",             "New Orleans"],
        "RB2" => ["Derrick Henry",            "Tennessee"],
        "RBB" => ["Aaron Jones",              "Green Bay"],
        "WR1" => ["Allen Robinson",           "Chicago"],
        "WR2" => ["Devante Adams",            "Green Bay"],
        "WRB" => ["Marquez Valdez-Scantling", "Green Bay"],
        "TE" =>  ["Travis Kelce",             "Kansas City"],
        "TEB" => ["Robert Tonyan",            "Green Bay"],
        "K" =>   ["Jason Myers",              "Seattle"],
        "KB" =>  ["Mason Crosby",             "Green Bay"],
      },
    }

    ["Washington"].each do |nfl_team_name|
      nfl_team = NflTeam.find_or_create_by(name: nfl_team_name)
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
  end


  desc "load up games"
  task :games => :environment do
      # "x y" =>              [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
      games = {
      ["Indianapolis", "Buffalo", Time.utc(2021, 1, 9, 12, 00), 24, 27] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Jonathon Taylor" =>  [ 0,     0,      0,     1,      0,     0,      78,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Rodrigo Blankenship" => [ 0,  0,      0,     0,      0,     0,      78,     0,     0,      0,      0,      1,      0,       0,     1,   0      ],

        "Josh Allen" =>       [ 2,     0,      0,     1,      324,   0,      54,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Stefon Diggs" =>     [ 0,     0,      1,     0,      0,     128,    0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Tyler Bass" =>       [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      1,      1,       0,     3,   0      ],
      },

      ["Los Angeles", "Seattle", Time.utc(2021, 1, 9, 15, 00), 30, 20] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Matt Gay" =>         [ 0,     0,      0,     0,      0,     0,      0,     0,     0,      0,      0,      0,      0,       3,     3,   0      ],

        "DK Metcalf" =>       [ 0,     0,      2,     0,      0,     96,     0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Chris Carson" =>     [ 0,     0,      0,     0,      0,     0,      77,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Jason Myers" =>      [ 0,     0,      0,     0,      0,     0,      0,     0,     0,      0,      0,      0,      0,       2,     2,   0      ],
      },

      ["Tampa Bay", "Washington", Time.utc(2021, 1, 9, 19, 00), 31, 23] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Tom Brady" =>        [ 2,     0,      0,     0,      381,   0,      0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Mike Evans" =>       [ 0,     0,      0,     0,      0,     119,    0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Chris Godwin" =>     [ 0,     0,      1,     0,      0,     79,     0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Rob Gronkowski" =>   [ 0,     0,      0,     0,      0,     0,      0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
      },

      ["Baltimore", "Tennessee", Time.utc(2021, 1, 10, 12, 00), 20, 13] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Derrick Henry" =>     [ 0,     0,      0,     0,      0,     11,     40,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "AJ Brown" =>          [ 0,     0,      1,     0,      0,     83,     0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],

        "Lamar Jackson" =>     [ 0,     1,      0,     1,      179,   0,      136,   0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "JK Dobbins" =>        [ 0,     0,      0,     1,      0,     0,      43,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Mark Andrews" =>      [ 0,     0,      0,     0,      0,     41,     0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Justin Tucker" =>     [ 0,     0,      0,     0,      0,     0,      0,     0,     0,      0,      0,      1,      0,       1,     2,   0      ],
      },

      ["Chicago", "New Orleans", Time.utc(2021, 1, 10, 12, 00), 9, 21] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Alvin Kamara" =>     [ 0,     0,      0,     1,      0,     17,      99,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Will Lutz" =>        [ 0,     0,      0,     0,      0,     0,       0,      0,     0,      0,      0,      0,      0,       0,     3,   0      ],

        "Allen Robinson" =>   [ 0,     0,      0,     0,      0,     55,      0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Cairo Santos" =>     [ 0,     0,      0,     0,      0,     0,       0,      0,     0,      0,      0,      1,      0,       0,     0,   0      ],
      },

      ["Cleveland", "Pittsburg", Time.utc(2021, 1, 10, 19, 00), 48, 37] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Baker Mayfield" =>    [ 3,     0,      0,     0,      263,   0,       17,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Nick Chubb" =>        [ 0,     0,      1,     0,      0,     69,      76,    0,     0,      0,      0,      0,      0,       0,     3,   0      ],

        "Eric Ebron" =>        [ 0,     0,      1,     0,      0,     62,       0,    0,     0,      0,      0,      0,      0,       0,     3,   0      ],
      },

      ["Los Angeles", "Green Bay", Time.utc(2021, 1, 16, 15, 30), 18, 32] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Matt Gay" =>         [ 0,     0,      0,     0,      0,     0,      0,     0,     0,      0,      0,      1,      0,       0,     1,   0      ],

        "Aaron Rodgers" =>    [ 2,     0,      0,     1,      296,    0,       0,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Aaron Jones" =>      [ 0,     0,      0,     1,      0,     14,       99,   0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Devante Adams" =>    [ 0,     0,      1,     0,      0,     66,       0,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Robert Tonyan" =>    [ 0,     0,      0,     0,      0,     60,       0,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Mason Crosby" =>     [ 0,     0,      0,     0,      0,     0,        0,    0,     0,      0,      0,      2,      0,       0,     2,   0      ],
      },

      ["Baltimore", "Buffalo", Time.utc(2021, 1, 16, 19, 00), 3, 17] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Lamar Jackson" =>     [ 0,     1,      0,     0,      162,   0,      34,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "JK Dobbins" =>        [ 0,     0,      0,     0,      0,     51,     42,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Mark Andrews" =>      [ 0,     0,      0,     0,      0,     28,     0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Justin Tucker" =>     [ 0,     0,      0,     0,      0,     0,      0,     0,     0,      0,      0,      1,      0,       0,     0,   2      ],

        "Josh Allen" =>       [ 1,     0,      0,     0,      206,   0,      3,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Stefon Diggs" =>     [ 0,     0,      1,     0,      0,     106,    0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Tyler Bass" =>       [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      1,      0,       0,     2,   2      ],
      },

      ["Cleveland", "Kansas City", Time.utc(2021, 1, 17, 14, 00), 17, 22] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Baker Mayfield" =>    [ 1,     0,      0,     0,      204,   0,       11,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Nick Chubb" =>        [ 0,     0,      0,     0,      0,     4,       69,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],

        "Patrick Mahomes" =>   [ 1,     0,      0,     1,      255,   0,       14,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Travis Kelce" =>      [ 0,     0,      1,     0,      0,     109,     0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Tyrek Hill" =>        [ 0,     0,      0,     0,      0,     110,     9,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Harrison Butker" =>   [ 0,     0,      0,     0,      0,     0,       0,     0,     0,      0,      0,      2,      0,       1,     1,   1      ],
      },

      ["Tampa Bay", "New Orleans", Time.utc(2021, 1, 17, 18, 00), 30, 20] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Tom Brady" =>        [ 2,     0,      0,     1,      199,   0,      2,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Mike Evans" =>       [ 0,     0,      1,     0,      0,     3,      0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Chris Godwin" =>     [ 0,     0,      0,     0,      0,     34,     0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Rob Gronkowski" =>   [ 0,     0,      0,     0,      0,     14,     0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],

        "Alvin Kamara" =>     [ 0,     0,      0,     1,      0,     20,     85,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Will Lutz" =>        [ 0,     0,      0,     0,      0,     0,      0,     0,     0,      0,      0,      1,      1,       0,     2,   0      ],
      },

      ["Tampa Bay", "Green Bay", Time.utc(2021, 1, 24, 14, 00), 31, 26] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Tom Brady" =>        [ 3,     3,      0,     0,      280,   0,      0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Mike Evans" =>       [ 0,     0,      1,     0,      0,     51,     0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Chris Godwin" =>     [ 0,     0,      0,     0,      0,     110,    6,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Rob Gronkowski" =>   [ 0,     0,      0,     0,      0,     29,     0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],

        "Aaron Rodgers" =>    [ 3,     1,      0,     0,      346,    0,       0,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Aaron Jones" =>      [ 0,     0,      0,     0,      0,      7,       27,   0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Devante Adams" =>    [ 0,     0,      1,     0,      0,     67,       0,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Robert Tonyan" =>    [ 0,     0,      1,     0,      0,     22,       0,    0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Mason Crosby" =>     [ 0,     0,      0,     0,      0,     0,        0,    0,     0,      0,      0,      2,      0,       0,     2,   0      ],
      },

      ["Buffalo", "Kansas City", Time.utc(2021, 1, 24, 17, 00), 24, 38] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Josh Allen" =>       [ 2,     1,      0,     0,      287,   0,      88,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Stefon Diggs" =>     [ 0,     0,      0,     0,      0,     77,     0,      0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Tyler Bass" =>       [ 0,     0,      0,     0,      0,     0,      0,      0,     0,      0,      0,      2,      0,       2,     0,   0      ],

        "Patrick Mahomes" =>   [ 3,     0,      0,     1,      325,   0,       8,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Travis Kelce" =>      [ 0,     0,      2,     0,      0,     118,     0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Tyrek Hill" =>        [ 0,     0,      0,     0,      0,     172,     0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Harrison Butker" =>   [ 0,     0,      0,     0,      0,     0,       0,     0,     0,      0,      0,      0,      1,       0,     5,   0      ],
      },

      ["Kansas City", "Tampa Bay" , Time.utc(2021, 2, 7, 17, 30), 9, 31] => {
        #                     PassTD PassInt RecvTD RushTD PassYds RecvYds RushYds Fmbl,  2PTPass 2PTRecv 2PTRush 0-39FGs 40-49FGs 50+FGs ExPt FGMiss
        "Tom Brady" =>         [ 3,     0,      0,     0,      201,   0,      0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Mike Evans" =>        [ 0,     0,      0,     0,      0,     31,     0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Chris Godwin" =>      [ 0,     0,      0,     0,      0,     9,      0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Rob Gronkowski" =>    [ 0,     0,      2,     0,      0,     67,     0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],

        "Patrick Mahomes" =>   [ 0,     1,      0,     1,      212,   0,       8,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Travis Kelce" =>      [ 0,     0,      0,     0,      0,     117,     0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Tyrek Hill" =>        [ 0,     0,      0,     0,      0,     61,      0,     0,     0,      0,      0,      0,      0,       0,     0,   0      ],
        "Harrison Butker" =>   [ 0,     0,      0,     0,      0,     0,       0,     0,     0,      0,      0,      1,      1,       1,     0,   0      ],
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
