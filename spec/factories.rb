FactoryBot.define do
  factory :calendar do
    name { 'Marketing Calendar' }
    password { '1234567' }
  end

  factory :event do
    title { 'New Meeting' }
    description { 'New Meeting descripton' }
    start_date { '2022-09-26 12:12:00 UTC' }
    end_date { '2022-09-26 13:00:00 UTC' }
    location { 'Italy' }
    calendar
  end

  factory :event2 do
    title { 'New Meeting 2' }
    description { 'New Meeting descripton 2' }
    start_date { '2022-09-20 12:12:00 UTC' }
    end_date { '2022-09-20 13:00:00 UTC' }
    location { 'France' }
    calendar
  end
end
