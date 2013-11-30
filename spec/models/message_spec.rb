require 'spec_helper'

describe Message do
  it 'does not save message without sender & recipient' do
    message = Message.new

    expect(message.save).to eq(false)
  end

  it 'does not save message without sender or recipient' do
    user = FactoryGirl.create :user
    message = Message.new(sender: user)

    expect(message.save).to eq(false)

    message = Message.new(recipient: user)
    expect(message.save).to eq(false)
  end

  it 'saves message with sender, recipient & content' do
    sender = FactoryGirl.create :user
    recipient = FactoryGirl.create :user
    message = Message.new(sender: sender, recipient: recipient, content: 'Hello')

    expect(message.save).to eq(true)
  end
end
