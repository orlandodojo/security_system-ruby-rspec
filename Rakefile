require 'rubygems'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.spec_opts = ['--colour', '--format documentation']
end

desc "Default build will run specs"
task :default => :spec