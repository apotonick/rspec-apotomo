require "spec_helper"
require "generators/rspec/widget_generator"

describe Rspec::Generators::WidgetGenerator do
  include RSpec::Rails::RailsExampleGroup

  attr_accessor :test_case, :test

  before(:all) do
    test_case = Class.new(Rails::Generators::TestCase)
    test_case.destination_root = File.expand_path("../../tmp", __FILE__)
    test_case.generator_class = Rspec::Generators::WidgetGenerator
    self.test = test_case.new :wow
    test.run_generator %w(Twitter::Tweet display form)
  end

  it "creates widget spec" do
    test.assert_file "spec/widgets/tweet_widget_spec.rb", /require 'spec_helper'/
    test.assert_file "spec/widgets/tweet_widget_spec.rb", /describe Twitter::TweetWidget do/
    test.assert_file "spec/widgets/tweet_widget_spec.rb", /has_widgets do |root|/
    test.assert_file "spec/widgets/tweet_widget_spec.rb", /root << widget\('twitter\/tweet'\)/
    test.assert_file "spec/widgets/tweet_widget_spec.rb", /end/
  end

  it 'creates display state' do
    test.assert_file "spec/widgets/tweet_widget_spec.rb", /it "should render :display" do/
    test.assert_file "spec/widgets/tweet_widget_spec.rb", /render_widget\('twitter\/tweet', :display\).should have_selector\("h1"\)/
    test.assert_file "spec/widgets/tweet_widget_spec.rb", /end/
  end

  it 'creates form state' do
    test.assert_file "spec/widgets/tweet_widget_spec.rb", /it "should render :form" do/
    test.assert_file "spec/widgets/tweet_widget_spec.rb", /render_widget\('twitter\/tweet', :form\).should have_selector\("h1"\)/
    test.assert_file "spec/widgets/tweet_widget_spec.rb", /end/
  end
end
