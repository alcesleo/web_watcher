require "rake"
require "hanami/rake_tasks"

# Tasks only available for development/test
unless ENV["HANAMI_ENV"] == "production"
  require "rake/testtask"
  require "rubocop/rake_task"

  task default: [:test, :style]

  Rake::TestTask.new do |t|
    t.pattern = "spec/**/*_spec.rb"
    t.libs << "spec"
    t.warning = false
  end

  RuboCop::RakeTask.new(:style) do |t|
    t.options = ["--display-cop-names"]
  end
end

task refresh_watchers: :environment do
  Refresh.call
end
