require 'spec_helper'

describe "Capybara support" do
  include RSpec::Rails::WidgetExampleGroup

  has_widgets do |root|
    root << widget(:dummy)
  end

  it "can use rendered to get the result of render_widget" do
    ::Apotomo::Widget.any_instance.stub(:render_widget).and_return("<html><body><h1>Hello!</h1></body></html>")
    render_widget(:some_widget)
    rendered.should have_xpath('//h1')
  end
end