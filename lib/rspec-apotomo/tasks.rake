require 'rspec/core/rake_task'

namespace :spec do
  desc "Run the code examples in spec/widgets"
  RSpec::Core::RakeTask.new("widgets") do |t|
    t.pattern = "./spec/widgets/**/*_spec.rb"
  end
end