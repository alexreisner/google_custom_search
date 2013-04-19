require 'bundler/setup'
require "bundler/gem_tasks"
require 'rake/clean'
require "rspec/core/rake_task"

CLEAN.include('pkg')
CLEAN.include('coverage')

RSpec::Core::RakeTask.new('spec')

task :default => :spec

namespace :spec do
  desc "Run all specs tagged with :focus => true"
  RSpec::Core::RakeTask.new(:focus) do |t|
    t.rspec_opts = "--tag focus"
    t.verbose = true
  end
end
