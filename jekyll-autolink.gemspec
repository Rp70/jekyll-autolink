# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-autolink/version'

Gem::Specification.new do |spec|
  spec.name = 'jekyll-autolink'
  spec.version = JekyllAutolink::VERSION
  spec.authors = ['Rp70']
  spec.email = ['']
  spec.summary = 'Autolink automatically parses text and turns anything that remotely resembles a link into an HTML link.'
  spec.description = 'Autolink automatically parses text and turns anything that remotely resembles a link into an HTML link for Jekyll sites.'
  spec.homepage = 'https://github.com/Rp70/jekyll-autolink'
  spec.license = 'MIT'
  spec.files = `git ls-files -z`.split("\x0")
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.3.0'
  spec.add_dependency 'jekyll', '>= 3.0'
  spec.add_dependency 'rinku', '>= 1.7.0'
  spec.add_development_dependency 'bundler', '~> 2.0'

end
