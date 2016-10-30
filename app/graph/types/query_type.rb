QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :viewer do
    type UserType
    description "Current user"
    resolve ->(obj, args, ctx) {
      ctx[:current_user]
    }
  end

  field :post do
    type PostType
    description "Get post by ID"

    argument :id, !types.Int

    resolve ->(obj, args, ctx) {
      ctx[:current_user].posts.find(args[:id])
    }
  end

  field :posts do
    type types[PostType]
    description "Get posts"

    resolve ->(obj, args, ctx) {
      ctx[:current_user].posts
    }
  end
end