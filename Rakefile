# encoding: utf-8

require 'rubygems'
require 'bundler'
require './lib/stuart/version'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end
require 'rake'
require 'juwelier'
Juwelier::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = 'stuart-client-ruby'
  gem.homepage = 'http://github.com/stuartapp/stuart-client-ruby'
  gem.license = 'MIT'
  gem.summary = 'Stuart API Ruby client'
  gem.description = 'Communicate with the Stuart API'
  gem.email = 'engineering@stuart.com'
  gem.authors = ['Paul Caillau', 'Maximilien Tyc']
  gem.version = Stuart::Version::STRING
  # dependencies defined in Gemfile
end
Juwelier::RubygemsDotOrgTasks.new
require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

desc 'Code coverage detail'
task :simplecov do
  ENV['COVERAGE'] = 'true'
  Rake::Task['test'].execute
end

task default: :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "stuart-client-ruby #{Stuart::Version::STRING}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
