RSpec.describe Graph::CreatePostService do
  describe '#perform!' do
    subject { described_class.new(inputs, ctx).perform! }
    let(:user) { create(:user) }
    let(:inputs) do
      post = build_stubbed(:post)
      {
        title: post.title,
        content: post.content
      }
    end
    let(:ctx) { { current_user: user } }

    it "creates new post" do
      expect { subject }.to change { Post.count }.by(1)
    end

    it "returns post" do
      expect(subject).to eq(
        {
          post: Post.last
        }
      )
    end
  end
end