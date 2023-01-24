class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name, :username, :updated_at
end
