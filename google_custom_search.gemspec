# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "version"

Gem::Specification.new do |s|
  s.name        = "google_custom_search"
  s.version     = GoogleCustomSearch::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Alex Reisner"]
  s.email       = ["alex@alexreisner.com"]
  s.homepage    = "http://github.com/alexreisner/google_custom_search"
  s.date        = Date.today.to_s
  s.summary     = "Ruby interface to Google Custom Search Engine."
  s.description = "Ruby interface to Google Custom Search Engine. Works with the paid version of CSE where you get results in XML format."
  s.files       = `git ls-files`.split("\n") - %w[google_custom_search.gemspec Gemfile init.rb]
  s.require_paths = ["lib"]
end
