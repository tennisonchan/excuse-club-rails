class ExcuseSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :start_at, :end_at
end
