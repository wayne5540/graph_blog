PostType = GraphQL::ObjectType.define do
  name "Post"
  description "A post"

  field :id, types.Int
  field :title, types.String
  field :content, types.String
  field :updated_at do
    type types.Int

    resolve -> (obj, args, ctx) {
      obj.updated_at.to_i
    }
  end
  field :created_at do
    type types.Int

    resolve -> (obj, args, ctx) {
      obj.created_at.to_i
    }
  end
end