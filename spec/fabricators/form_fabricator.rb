Fabricator :form do
  name { Faker::Lorem.words(3).join(' ').capitalize }
  description { Faker::Lorem.paragraph }
  date Date.tomorrow
  starts_at 3.hours.from_now
  ends_at 6.hours.from_now
end
