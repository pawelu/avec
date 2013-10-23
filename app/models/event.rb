class Event
  include Mongoid::Document

  field :title,         type: String
  field :content,       type: String
  field :date_start,    type: DateTime
  field :date_end,      type: DateTime
  field :done,          type: Boolean, default: false


  belongs_to :user, :class_name => "User"

end