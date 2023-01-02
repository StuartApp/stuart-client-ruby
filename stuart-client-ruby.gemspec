# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: stuart-client-ruby 1.1.1.pre.rc.9 ruby lib

require_relative './lib/stuart-client-ruby/version'

Gem::Specification.new do |s|
  s.name = "stuart-client-ruby"
  s.name = "stuart-client-ruby".freeze
  s.version = Stuart::Version::STRING

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Paul Caillau".freeze, "Maximilien Tyc".freeze]
  s.date = "2023-01-02"
  s.description = "Communicate with the Stuart API".freeze
  s.email = "engineering@stuart.com".freeze
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rubocop.yml",
    "Gemfile",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "lib/stuart-client-ruby.rb",
    "lib/stuart-client-ruby/client.rb",
    "lib/stuart-client-ruby/infrastructure/api_response.rb",
    "lib/stuart-client-ruby/infrastructure/authenticator.rb",
    "lib/stuart-client-ruby/infrastructure/environment.rb",
    "lib/stuart-client-ruby/infrastructure/http_client.rb",
    "lib/stuart-client-ruby/version.rb",
    "spec/spec_helper.rb",
    "spec/stuart-client-ruby/infrastructure/authenticator_spec.rb",
    "spec/stuart-client-ruby/infrastructure/http_client_spec.rb",
    "stuart-client-ruby.gemspec"
  ]
  s.homepage = "http://github.com/stuartapp/stuart-client-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.25".freeze
  s.summary = "Stuart API Ruby client".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<oauth2>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<typhoeus>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<juwelier>.freeze, [">= 0"])
    s.add_development_dependency(%q<rdoc>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_development_dependency(%q<shoulda>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  else
    s.add_dependency(%q<oauth2>.freeze, [">= 0"])
    s.add_dependency(%q<typhoeus>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<juwelier>.freeze, [">= 0"])
    s.add_dependency(%q<rdoc>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<shoulda>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end

