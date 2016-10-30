CreatePostMutation = GraphQL::Relay::Mutation.define do
  name "CreatePost"

  input_field :title, !types.String
  input_field :content, types.String

  return_field :post, PostType

  resolve -> (object, inputs, ctx) {
    Graph::CreatePostService.new(inputs, ctx).perform!
  }
end