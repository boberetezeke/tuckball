class Team < ApplicationRecord
  has_many :team_memberships
  has_many :players, through: :team_memberships
end