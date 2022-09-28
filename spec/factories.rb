FactoryBot.define do
  
  id = rand(-100)

  factory :calendar do
    id { id }
    name { 'Marketing Calendar' }
    password { '1234567' }
  end

  factory :event do
    title { 'New Meeting' }
    description { 'New Meeting descripton' }
    start_date { '2022-09-26 12:12:00 UTC' }
    end_date { '2022-09-26 13:00:00 UTC' }
    location { 'Italy' }
    calendar_id { id }
  end
end
