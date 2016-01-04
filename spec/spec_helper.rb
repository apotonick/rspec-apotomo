require 'bundler/setup'

require "action_controller/railtie"
require "action_view/railtie"
require "rspec-apotomo"
require "rspec/rails"

Rails.application = Class.new(Rails::Application)
# Rails.application.routes.append do |r|
#   r.match "/render_event_response", :as => :apotomo_event_path
# end

# This class is used as a dummy widget for testing

module Rails
  def root
    Pathname.new(__FILE__).dirname.dirname.dirname
  end
end

module RSpecApotomo
  class Application < ::Rails::Application
  end
end

require 'rspec/rails/example/widget_example_group'

# This class is used as a dummy widget for testing
class DummyWidget < Apotomo::Widget
  responds_to_event :doo

  def display
    @some_variable = :some_value
    render
  end
end
DummyWidget.append_view_path "spec/fixtures"
