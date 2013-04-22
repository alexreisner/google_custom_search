# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google_custom_search/version'

Gem::Specification.new do |gem|
  gem.name          = "google_custom_search"
  gem.version       = GoogleCustomSearch::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["Alex Reisner"]
  gem.email         = ["alex@alexreisner.com"]
  gem.homepage      = "http://github.com/alexreisner/google_custom_search"
  gem.date          = Date.today.to_s
  gem.summary       = "Ruby interface to Google Custom Search Engine."
  gem.description   = "Ruby interface to Google Custom Search Engine. Works with the paid version of CSE where you get results in XML format."
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "multi_xml", ">= 0.5.3"
  gem.add_dependency "addressable", ">= 2.3.4"

  begin
    if !defined?(JRUBY_VERSION)
      gem.add_dependency "ox", ">= 1.5.9"
    end
  rescue
    puts "Could not detect ruby version"
  end
end
