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
  field :avatar, type: String
  field :last_activity_at, type: DateTime

  has_many :events, inverse_of: :user
  has_and_belongs_to_many :skills, class_name: 'Skill', index: true
  has_one :profile

  has_many :topics
  has_many :posts
  has_many :comments

  has_many :sent_messages, class_name: 'Message', inverse_of: :sender
  has_many :received_messages, class_name: 'Message', inverse_of: :recipient

  has_and_belongs_to_many :participations, class_name: 'Event', inverse_of: :participants

  def update_last_activity_at
    self.update_attribute(:last_activity_at, Time.now)
  end
end
