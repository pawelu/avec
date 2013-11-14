require 'spec_helper'

describe DashboardController do
  describe '#index' do
    before do
      @event = FactoryGirl.create :event
    end

    it 'contains created event on list' do
      get :index

      response.status.should == 200
      response.body.should include('Zaloguj')
    end
  end
end
