class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  resourcify
  include Authority::Abilities
  attr_accessor :date_start, :time_start, :date_end, :time_end

  field :name,              type: String
  field :description,       type: String
  field :datetime_start,    type: DateTime
  field :datetime_end,      type: DateTime
  field :done,              type: Boolean, default: false
  field :capacity,          type: Integer
  field :address,           type: String

  has_many :participants, class_name: 'User'

  scope :incoming, -> {
    where(datetime_start: beginning_of_today .. (beginning_of_today + 1.month))
  }

  scope :past, -> {
    where(:datetime_start.lt => beginning_of_today)
  }

  belongs_to :user

  validates_presence_of :name, :address, :datetime_start

  validates :capacity, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 2
  }, unless: -> { self.capacity.blank? }

  def participants_list
    participants.map(&:nickname).join(', ')
  end

  def self.beginning_of_today
    Time.zone.now.beginning_of_day
  end
end
