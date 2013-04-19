require 'multi_xml'

$:.unshift(File.dirname(File.expand_path(__FILE__)))

$KCODE = 'u' if RUBY_VERSION.to_f < 1.9

require 'google_custom_search/configuration'
require 'google_custom_search/google_custom_search'
require 'google_custom_search/version'

if defined?(JRUBY_VERSION)
  MultiXml.parser = :rexml
else
  MultiXml.parser = :ox
end
