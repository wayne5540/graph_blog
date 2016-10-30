UserType = GraphQL::ObjectType.define do
  interfaces [ActiveRecordInterface]
  name "User"
  description "A user"

  field :email, types.String
end