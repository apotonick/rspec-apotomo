require 'apotomo'
require 'apotomo/test_case'

module RSpec::Rails
  module WidgetExampleGroup
    extend ActiveSupport::Concern
    
    include Apotomo::TestCase::TestMethods
    
    module InstanceMethods
      # TODO documentation
      def parent_controller
        @controller = ::ActionController::Base.new
        @controller.extend Apotomo::Rails::ControllerMethods
      end

      # TODO documentation
      def response
        @response
      end

      include ::Apotomo::WidgetShortcuts
    end
  end
end
