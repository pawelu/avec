class Profile
  include Mongoid::Document

  belongs_to :user,  :class_name => "User"
end
