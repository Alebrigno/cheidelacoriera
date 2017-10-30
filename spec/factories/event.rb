# frozen_string_literal: true

FactoryGirl.define do
  factory :event do
    date { Date.new(2017, 9, 20) }
    time { Time.new(2017, 9, 20, 20, 45).in_time_zone('UTC') }
    season { '2017/2018' }
    score { '5-1' }
    venue { FFaker::Address.city }
    home_team { FactoryGirl.create :team }
    away_team { FactoryGirl.create :team }
    poster_url { FFaker::Avatar.image }
    competition
  end
end
