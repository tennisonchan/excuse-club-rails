class ExcuseSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :start_at, :end_at, :brother_id

  has_many :beggings, serializer: BuddySerializer
end
