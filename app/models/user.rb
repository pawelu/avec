class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :nickname, type: String
  field :email, type: String

  has_many :events
  has_one :profile
end
