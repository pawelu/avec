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

  belongs_to :user, inverse_of: :events
  has_and_belongs_to_many :participants, class_name: 'User', inverse_of: :participations
  has_many :comments

  scope :incoming, -> {
    where(datetime_start: today..month_later).order_by(:datetime_start.asc)
  }

  scope :past, -> {
    where(:datetime_start.lt => today).order_by(:datetime_start.desc)
  }


  validates_presence_of :name, :address, :datetime_start

  validates :capacity, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 2
  }, unless: -> { self.capacity.blank? }

  def participants_list
    participants.map(&:nickname).join(', ')
  end

  def self.today
    Time.zone.now.beginning_of_day
  end

  def self.month_later
    self.today + 1.month
  end
end
