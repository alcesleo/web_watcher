Fabricator(:watcher) do
  description "Test description"
  url         "http://www.test.com"
  selector    "#selector"
  email       Faker::Internet.email
end

Fabricator(:request) do
  status_code 200
  value       { sequence(:value) { |i| "response text #{i}" } }
  watcher_id  { Fabricate.create(:watcher).id }
end
