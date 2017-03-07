source "https://rubygems.org"

ruby "~> 2.3.1"

gem "hanami",       "1.0.0.beta2"
gem "hanami-model", "~> 1.0.0.beta2"
gem "rake", "~> 12.0"

gem "http", "~> 2.2.1"
gem "oga",  "~> 2.9"
gem "pg",   "~> 0.19"

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem "shotgun", "~> 0.9"
end

group :test, :development do
  gem "dotenv", "~> 2.2"
  gem "pry"
  gem "rubocop", "~> 0.47", require: false
end

group :test do
  gem "capybara", "~> 2.12"
  gem "minitest", "~> 5.10"
  gem "webmock",  "~> 2.3"
end

group :production do
  gem "puma"
end
