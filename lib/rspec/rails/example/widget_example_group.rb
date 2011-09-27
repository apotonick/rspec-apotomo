require 'apotomo'
require 'apotomo/test_case'
require 'rspec/rails'

module RSpec::Rails
  module WidgetExampleGroup
    extend ActiveSupport::Concern

    include Apotomo::TestCase::TestMethods

    if defined?(Webrat)
      include Webrat::Matchers
      include Webrat::Methods
    end

    if defined?(Capybara)
      begin
        include Capybara::DSL
      rescue NameError
        include Capybara
      end

      # Overwrite to wrap render_widget into a Capybara custom string with a
      # lot of matchers.
      #
      # Read more at:
      #
      # The Capybara.string method documentation:
      #   - http://rubydoc.info/github/jnicklas/capybara/master/Capybara#string-class_method
      #
      # Return value is an instance of Capybara::Node::Simple
      #   - http://rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Simple
      #
      # That expose all the methods from the following capybara modules:
      #   - http://rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Matchers
      #   - http://rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Finders
      def render_widget(*args)
        @last_invoke = Capybara.string super
      end
    end

    included do
      before do
        setup # defined in Apotomo::TestCase.
        @routes = ::Rails.application.routes
        ActionController::Base.allow_forgery_protection = false
        @controller.request = ::ActionController::TestRequest.new
      end
    end

    module InstanceMethods
      def rendered
        @last_invoke
      end

      attr_reader :controller
      include ::Apotomo::WidgetShortcuts
    end
  end
end
