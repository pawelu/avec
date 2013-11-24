require 'spec_helper'

describe 'events participation' do
  before do
    @user = FactoryGirl.create :user
    ActionDispatch::Request::Session.any_instance.stub(:[]).with(:user_id).and_return(@user.id)
    @event1 = FactoryGirl.create :event, :datetime_start => Time.now
    @event2 = FactoryGirl.create :event, :datetime_start => Time.now
  end

  describe 'I should be able to participate in many events' do
    it 'allows me to participate in 2 created events' do
      visit '/'

      expect(page.body).to have_content('Wydarzenia')

      within("form[action='#{participate_event_path(@event1)}']") do
        find_button('Dołącz').click
      end

      within("form[action='#{participate_event_path(@event2)}']") do
        find_button('Dołącz').click
      end

      find("form[action='#{retreat_event_path(@event1)}']").should have_button('Zrezygnuj')
      find("form[action='#{retreat_event_path(@event2)}']").should have_button('Zrezygnuj')
    end
  end
end
