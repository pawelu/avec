require 'spec_helper'

describe 'dashboard' do
  context 'guest' do
    it 'shows me login button' do
      visit '/'

      expect(page).to have_content('Zaloguj przez Githuba')
    end
  end

  context 'logged user' do
    before do
      @user = FactoryGirl.create :user
      ActionDispatch::Request::Session.any_instance.stub(:[]).with(:user_id).and_return(@user.id)
      @event = FactoryGirl.create :event, :date_start => Date.today, :date_end => Date.today
    end

    it 'shows me info about events' do
      visit '/'

      expect(page).to have_content('Wydarzenia')
      expect(page).to have_content(@event.name)
    end
  end
end
