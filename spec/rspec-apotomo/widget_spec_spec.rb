require 'spec_helper'
require 'rails/all' # TODO This probably should be someplace else
require 'rspec/rails/example/widget_example_group'
require 'apotomo'

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

    context "as a user would use rspec-apotomo" do
      include WidgetExampleGroup

      it "calls render_widget in apotomo's widget'" do
        ::Apotomo::Widget.any_instance.should_receive(:render_widget)
        render_widget(:some_widget)
      end

      it "can use response to get the result of render_widget" do
        ::Apotomo::Widget.any_instance.stub(:render_widget).and_return("expected string")
        render_widget(:some_widget)
        response.should == "expected string"
      end

    end
  end
end
