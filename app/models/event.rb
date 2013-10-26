class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessor :date_start, :time_start, :date_end, :time_end

  field :title,         type: String
  field :content,       type: String
  field :datetime_start,    type: DateTime
  field :datetime_end,      type: DateTime
  field :done,          type: Boolean, default: false

  belongs_to :user

  validates_presence_of :title, :content

  validates_presence_of :date_start, :time_start, :date_end, :time_end

  before_save :set_dates

  def set_dates
    year, month, day = self.date_start.split('-').map(&:to_i)
    hour, minutes = self.time_start.split(':').map(&:to_i)
    self.datetime_start = DateTime.new(year, month, day, hour, minutes)

    year, month, day = self.date_end.split('-').map(&:to_i)
    hour, minutes = self.time_end.split(':').map(&:to_i)
    self.datetime_end = DateTime.new(year, month, day, hour, minutes)
  end
end
