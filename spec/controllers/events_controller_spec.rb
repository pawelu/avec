require 'spec_helper'

describe EventsController do
  it "should create event" do
    event = Event.new(:name => "Foo", :description => "Bar")
  end
  it "should redirect to root_path" do
    redirect_to root_path
  end
end
