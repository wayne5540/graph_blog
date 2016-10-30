PostType = GraphQL::ObjectType.define do
  interfaces [ActiveRecordInterface]
  name "Post"
  description "A post"

  field :title, types.String
  field :content, types.String
end