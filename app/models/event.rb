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

  DATES_FIX = [:start, :end]
  before_save :set_dates

  def set_dates
    DATES_FIX.each do |fix|
      year, month, day = self.send("date_#{fix}").split('-').map(&:to_i)
      hour, minutes = self.send("time_#{fix}").split(':').map(&:to_i)
      self.send("datetime_#{fix}=", DateTime.new(year, month, day, hour, minutes))
    end
  end
end
