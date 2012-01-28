require "spec_helper"
require "generators/rspec/widget_generator"
require "generator_spec/test_case"

describe Rspec::Generators::WidgetGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../tmp", __FILE__)
  arguments %w(Twitter::Tweet display form)

  before(:all) do
    prepare_destination
    run_generator
  end

  it "creates widget spec" do
    assert_file "spec/widgets/twitter/tweet_widget_spec.rb", /require 'spec_helper'/
    assert_file "spec/widgets/twitter/tweet_widget_spec.rb", /describe Twitter::TweetWidget do/
    assert_file "spec/widgets/twitter/tweet_widget_spec.rb", /has_widgets do |root|/
    assert_file "spec/widgets/twitter/tweet_widget_spec.rb", /root << widget\('twitter\/tweet'\)/
    assert_file "spec/widgets/twitter/tweet_widget_spec.rb", /end/
  end

  it 'creates display state' do
    assert_file "spec/widgets/twitter/tweet_widget_spec.rb", /it "should render :display" do/
    assert_file "spec/widgets/twitter/tweet_widget_spec.rb", /render_widget\('twitter\/tweet', :display\).should have_selector\("h1"\)/
    assert_file "spec/widgets/twitter/tweet_widget_spec.rb", /end/
  end

  it 'creates form state' do
    assert_file "spec/widgets/twitter/tweet_widget_spec.rb", /it "should render :form" do/
    assert_file "spec/widgets/twitter/tweet_widget_spec.rb", /render_widget\('twitter\/tweet', :form\).should have_selector\("h1"\)/
    assert_file "spec/widgets/twitter/tweet_widget_spec.rb", /end/
  end
end
