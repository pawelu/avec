require 'spec_helper'

describe Message do
  it 'does not save message without sender & recipient' do
    message = Message.new

    message.save.should == false
  end

  it 'does not save message without sender or recipient' do
    user = FactoryGirl.create :user
    message = Message.new(sender: user)

    message.save.should == false

    message = Message.new(recipient: user)
    message.save.should == false
  end

  it 'saves message with sender & recipient' do
    sender = FactoryGirl.create :user
    recipient = FactoryGirl.create :user
    message = Message.new(sender: sender, recipient: recipient)

    message.save.should == true
  end
end
