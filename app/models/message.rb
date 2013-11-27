class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :sender, class_name: 'User', inverse_of: :sent_messages
  belongs_to :recipient, class_name: 'User', inverse_of: :received_messages
  validates_presence_of :sender, :recipient
end
