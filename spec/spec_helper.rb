require 'rubygems'
require 'bundler/setup'

require 'rspec'
require 'webmock/rspec'
require 'time'

if !defined?(JRUBY_VERSION)
  if ENV["COVERAGE"] == "on"
    require 'simplecov'
    SimpleCov.start do
      add_filter "/spec/"
      add_filter "/lib/google_custom_search.rb"
      add_filter "/vendor/"
      minimum_coverage 100
    end
  end
end

Dir['./spec/support/**/*.rb'].map {|f| require f}

WebMock.disable_net_connect!

$:.push File.expand_path("../lib", __FILE__)
require 'google_custom_search'

RSpec.configure do |c|
  c.run_all_when_everything_filtered = true
end
