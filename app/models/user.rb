class User
  include Mongoid::Document
  rolify
  include Mongoid::Timestamps
  include Authority::UserAbilities

  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :nickname, type: String
  field :email, type: String

  has_many :events
  has_and_belongs_to_many :skills
  has_one :profile
end
