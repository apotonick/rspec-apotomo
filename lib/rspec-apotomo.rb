require "rspec-apotomo/version"

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
      end
    end
  end
end
