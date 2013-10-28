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
    year, month, day, hour, minutes = extract_datetime_parts(self.date_start, self.time_start)
    self.datetime_start = Time.zone.local(year, month, day, hour, minutes)

    year, month, day, hour, minutes = extract_datetime_parts(self.date_end, self.time_end)
    self.datetime_end = Time.zone.local(year, month, day, hour, minutes)
  end

  private

    def extract_datetime_parts(date, time)
      [date, time].join(' ').split(/[ :-]/).map(&:to_i)
    end
end
