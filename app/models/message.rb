class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :deleted_by_sender, type: Boolean, default: false
  field :deleted_by_recipient, type: Boolean, default: false
  field :content, type: String
  field :read_at, type: DateTime

  belongs_to :sender, class_name: 'User', inverse_of: :sent_messages
  belongs_to :recipient, class_name: 'User', inverse_of: :received_messages
  validates_presence_of :sender, :recipient, :content
end
