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
  RuboCop::RakeTask.new(:style)

  task default: %i[test style]
end

task refresh: :environment do
  Refresher.call
end

task notify: :environment do
  Notifier.call
end

desc "Make requests and send notification emails"
task refresh_and_notify: %i[refresh notify]
