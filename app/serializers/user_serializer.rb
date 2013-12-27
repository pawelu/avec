class UserSerializer < ActiveModel::Serializer
  attributes :nickname, :avatar, :last_activity_at
end
