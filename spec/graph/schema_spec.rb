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
end