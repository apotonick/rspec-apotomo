module RSpec::Rails
  module WidgetExampleGroup

    # TODO documentation
    def render_widget(*args)
      @controller = ::ActionController::Base.new
      root = Apotomo::Widget.new(@controller, "root")
      @response = root.render_widget(*args)
    end

    # TODO documentation
    def response
      @response
    end

  end
end