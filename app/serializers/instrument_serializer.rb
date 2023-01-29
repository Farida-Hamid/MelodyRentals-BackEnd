class InstrumentSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :description, :price, :available, :category, :image
end
