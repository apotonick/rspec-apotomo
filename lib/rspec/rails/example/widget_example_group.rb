require 'apotomo'
require 'apotomo/test_case'

module RSpec::Rails
  module WidgetExampleGroup
    extend ActiveSupport::Concern

    include Apotomo::TestCase::TestMethods

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
