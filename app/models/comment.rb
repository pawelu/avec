class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :event
  belongs_to :user

  field :content, type: String
end
