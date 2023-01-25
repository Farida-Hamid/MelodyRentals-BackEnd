class InstrumentSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :description, :price, :quantity, :category, :image
end
