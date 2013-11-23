require 'spec_helper'

describe DashboardController do
  render_views

  describe '#index' do
    before do
      @user = FactoryGirl.create :user
      self.controller.stub(:current_user).and_return(@user)
      @event = FactoryGirl.create :event, user: @user, datetime_start: Time.now
    end

    it 'contains created event on list' do
      get :index

      response.status.should == 200
      response.body.should have_content(@event.name)
    end
  end
end
