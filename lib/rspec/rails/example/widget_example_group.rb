require 'apotomo'

module RSpec::Rails
  module WidgetExampleGroup
    extend ActiveSupport::Concern

    module InstanceMethods
      # TODO documentation
      def render_widget(*args)
        @response = root.render_widget(*args)
      end

      # TODO documentation
      def parent_controller
        @controller = ::ActionController::Base.new
        @controller.extend Apotomo::Rails::ControllerMethods
      end

      # TODO documentation
      def root
        block = self.class.widgets_added or raise "Please setup a widget tree using has_widgets()"
        @root ||= Apotomo::Widget.new(parent_controller, "root").tap do |root|
          self.instance_exec(root, &block)
        end
      end

      # TODO documentation
      def response
        @response
      end

      include ::Apotomo::WidgetShortcuts
    end

    module ClassMethods
      # TODO documentation
      def has_widgets(&blk)
        @widgets_added = blk
      end

      # TODO documentation
      def widgets_added
        @widgets_added
      end
    end

  end
end