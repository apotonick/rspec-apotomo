require 'generators/cells/base'

module Rspec
  module Generators
    class WidgetGenerator < ::Cells::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def create_cell_spec_file
        template "widget_spec.erb", File.join("spec/widgets/", class_path, "#{file_name}_widget_spec.rb")
      end
    end
  end
end
