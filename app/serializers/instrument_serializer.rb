class InstrumentSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :description, :price, :category, :image
end
