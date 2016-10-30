module Graph
  class CreatePostService
    def initialize(inputs, ctx)
      @current_user = ctx[:current_user]
      @params = inputs
    end

    def perform!
      post = @current_user.posts.create(title: @params[:title], content: @params[:content])

      {
        post: post
      }
    end
  end
end