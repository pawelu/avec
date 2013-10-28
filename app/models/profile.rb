class Profile
  include Mongoid::Document

  field :movie,           type: String

  belongs_to :user,  :class_name => "User"
end
