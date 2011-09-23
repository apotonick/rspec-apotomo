module RSpec::Rails
  module WidgetExampleGroup
    def render_widget(*args)
      @controller = ::ActionController::Base.new
      Apotomo::Widget.new(@controller, "root").render_widget(*args)
    end
  end
end