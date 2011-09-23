require 'spec_helper'
require 'rspec/rails/example/widget_example_group'

module RSpec::Rails
  describe WidgetExampleGroup do
    it "responds to render_widget" do
      group = RSpec::Core::ExampleGroup.describe do
        include WidgetExampleGroup
      end

      # TODO use the better syntax when bug: https://github.com/rspec/rspec-core/issues/460
      # group.new.should respond_to(:render_widget)
      group.new.respond_to?(:render_widget).should be_true
    end
  end
end