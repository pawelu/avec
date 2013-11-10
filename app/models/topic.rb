class Topic
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  belongs_to :user
  has_many :posts
end
