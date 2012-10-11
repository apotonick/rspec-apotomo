require "rspec/core"

module RSpec
  module Apotomo
    class Railtie < ::Rails::Railtie
      rake_tasks do
        load "rspec-apotomo/tasks.rake"
      end

      initializer 'apotomo.rspec' do
        require 'rspec/rails/example/widget_example_group'
        RSpec.configure do |c|
          c.include RSpec::Rails::WidgetExampleGroup, :example_group => { :file_path => /spec\/widgets/ }
        end

        unless defined?(Capybara) || defined?(Webrat)
          puts "**************************************************************"
          puts "rspec-apotomo's widget test requires either Capybara or Webrat" 
          puts "Please add either gem to your gemset to remove this warning"
          puts "**************************************************************"
        end
      end
    end
  end
end
