RSpec.describe Schema do
  let(:user) { create(:user) }
  let(:context) { { current_user: user } }
  let(:variables) { {} }
  let(:result) do
    Schema.execute(
      query_string,
      context: context,
      variables: variables
    )
  end

  describe "viewer" do
    let(:query_string) { %|query { viewer { email } }| }

    context "when there's no current user" do
      let(:context) { {} }

      it "is nil" do
        expect(result["data"]["viewer"]).to eq(nil)
      end
    end

    context "when there's a current user" do
      it "shows the user's email" do
        expect(result["data"]["viewer"]["email"]).to eq(user.email)
      end
    end
  end

  describe "createPost" do
    describe "viewer" do
      let(:query_string) do
        %|
          mutation ($post: CreatePostInput!) {
            createPost(input: $post) {
              post {
                id
                title
                content
              }
            }
          }
        |
      end
      let(:variables) do
        {
          "post" => {
            "title" => "Hello",
            "content" => "World!"
          }
        }
      end

      it 'creates a post' do
        expect { result }.to change { Post.count }.by(1)
      end

      it "returns new post" do
        expect(result["data"]["createPost"]["post"]["id"]).to eq(Post.last.id)
      end
    end
  end

  describe "post" do
    let(:post) { create(:post, user: user) }
    let(:query_string) do
      %|
        query {
          post(id: #{post.id}) {
            id
          }
        }
      |
    end


    it "returns post" do
      expect(result["data"]["post"]["id"]).to eq(post.id)
    end
  end

  describe "posts" do
    before do
      create_list(:post, 10, user: user)
      create_list(:post, 3)
    end

    let(:query_string) do
      %|
        query {
          posts {
            id
          }
        }
      |
    end


    it "returns post" do
      expect(result["data"]["posts"].count).to eq(10)
    end
  end
end