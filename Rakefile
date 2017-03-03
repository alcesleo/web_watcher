require "rake"
require "hanami/rake_tasks"
require "rake/testtask"
require "rubocop/rake_task"

task default: [:test, :style]

Rake::TestTask.new do |t|
  t.pattern = "spec/**/*_spec.rb"
  t.libs << "spec"
  t.warning = false
end

task spec: :test

RuboCop::RakeTask.new(:style) do |t|
  t.options = ["--display-cop-names"]
end
