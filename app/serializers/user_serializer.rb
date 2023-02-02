class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :username, :email, :created_at, :updated_at

  attributes :instruments do |object|
    object.instruments.map do |instrument|
      {
        id: instrument.id,
        name: instrument.name,
        description: instrument.description,
        price: instrument.price,
        available: instrument.available,
        category: instrument.category,
        image: instrument.image
      }
    end
  end
end
