require "rake"
require "hanami/rake_tasks"

# Tasks only available for development/test
unless ENV["RACK_ENV"] == "production"
  require "rake/testtask"
  Rake::TestTask.new do |t|
    t.pattern = "spec/**/*_spec.rb"
    t.libs << "spec"
    t.warning = false
  end

  require "rubocop/rake_task"
  RuboCop::RakeTask.new(:style) do |t|
    t.options = ["--display-cop-names"]
  end

  task default: [:test, :style]
end

task refresh_watchers: :environment do
  Refresher.call
end
