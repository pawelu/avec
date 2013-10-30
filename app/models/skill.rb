class Skill
  include Mongoid::Document

  field :name, type: String
  field :level, type: Integer

  has_and_belongs_to_many :users, class_name: 'User', index: true

  validates_presence_of :name, :level

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
