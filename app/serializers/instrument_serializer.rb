class InstrumentSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :price, :image, :category, :quantity
end
