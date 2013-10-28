class Skill
  include Mongoid::Document

  field :name, type: String
  field :level, type: Integer

  belongs_to :user

  validates_presence_of :name, :level
end
