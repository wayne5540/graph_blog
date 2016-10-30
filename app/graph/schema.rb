Schema = GraphQL::Schema.define do
  query QueryType
  mutation MutationType

  resolve_type -> (object, ctx) {
    type_name = object.class.name
    Schema.types[type_name]
  }
end