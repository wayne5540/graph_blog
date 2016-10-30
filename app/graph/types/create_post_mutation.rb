CreatePostMutation = GraphQL::Relay::Mutation.define do
  name "CreatePost"

  input_field :title, !types.String
  input_field :content, types.String

  return_field :post, PostType

  resolve -> (object, inputs, ctx) {
    post = ctx[:current_user].posts.create(title: inputs[:title], content: inputs[:content])

    {
      post: post
    }
  }
end