source "https://rubygems.org"

ruby ">= 2.3.1"

gem "hanami",       "~> 1.0.0.rc1"
gem "hanami-model", "~> 1.0.0.rc1"

gem "http", "~> 2.2.1"
gem "oga",  "~> 2.9"
gem "pg",   "~> 0.19"
gem "rake", "~> 12.0"

group :development do
  gem "letter_opener", "~> 1.4.1"
  gem "shotgun",       "~> 0.9"
end

group :test, :development do
  gem "dotenv", "~> 2.2"
  gem "pry"
  gem "rubocop", "~> 0.47", require: false
end

group :test do
  gem "capybara",           "~> 2.12"
  gem "faker",              "~> 1.7"
  gem "hanami-fabrication", "~> 0.1"
  gem "minitest",           "~> 5.10"
  gem "mocha",              "~> 1.2"
  gem "webmock",            "~> 2.3"
end

group :production do
  gem "puma"
end
