require 'apotomo'
require 'apotomo/test_case'

module RSpec::Rails
  module WidgetExampleGroup
    extend ActiveSupport::Concern

    include Apotomo::TestCase::TestMethods
    
    included do
      before do
        @parent_controller = Class.new(ActionController::Base).new
        @parent_controller.instance_eval do
          extend Apotomo::Rails::ControllerMethods
          def controller_path; 'barn'; end
        end

        @parent_controller.request = ::ActionController::TestRequest.new
      end
    end

    module InstanceMethods
      # TODO documentation
      def response
        @last_invoke
      end

      attr_reader :parent_controller
      include ::Apotomo::WidgetShortcuts
    end
  end
end
