require 'spec_helper'

describe Twitter::TweetWidget do
  has_widgets do |root|
    root << widget('twitter/tweet')
  end
  
  
    it "should render :display" do
      render_widget('twitter/tweet', :display).should have_selector("h1")
    end
  
    it "should render :form" do
      render_widget('twitter/tweet', :form).should have_selector("h1")
    end
  

end
