class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title,         type: String
  field :content,       type: String
  field :date_start,    type: DateTime
  field :date_end,      type: DateTime
  field :done,          type: Boolean, default: false


  belongs_to :user, :class_name => "User"

  validates_presence_of :title, :content, :date_start, :date_end

end
