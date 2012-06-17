require 'rake'
require 'rspec/core/rake_task'

class Rake::Task
  def abandon
    @actions.clear
  end
end

Rake::Task[:spec].abandon

task :spec do |t|
  #t.pattern = "./spec/{acceptance}/**/*_spec.rb"
  sh "rspec spec/unit && bundle exec rspec spec/acceptance"
end

namespace :spec do
  desc "Run acceptance specs"
  RSpec::Core::RakeTask.new(:acceptance) do |t|
    t.pattern = "./spec/acceptance/**/*_spec.rb"
  end
end

desc "Generate code coverage"
RSpec::Core::RakeTask.new(:coverage) do |t|
  t.pattern = "./spec/**/*_spec.rb" # don't need this, it's default.
  t.rcov = true
  t.rcov_opts = ['--exclude', 'spec']
end

desc 'Default: run specs.'
task :default => :spec

