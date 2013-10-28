class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessor :date_start, :time_start, :date_end, :time_end

  field :name,         type: String
  field :description,       type: String
  field :datetime_start,    type: DateTime
  field :datetime_end,      type: DateTime
  field :done,          type: Boolean, default: false

  belongs_to :user

  validates_presence_of :name, :description

  validates_presence_of :date_start, :time_start, :date_end, :time_end

  before_save :set_dates

  def set_dates
    year, month, day = self.date_start.split('-').map(&:to_i)
    hour, minutes = self.time_start.split(':').map(&:to_i)
    self.datetime_start = Time.zone.local(year, month, day, hour, minutes)

    year, month, day = self.date_end.split('-').map(&:to_i)
    hour, minutes = self.time_end.split(':').map(&:to_i)
    self.datetime_end = Time.zone.local(year, month, day, hour, minutes)
  end
end
