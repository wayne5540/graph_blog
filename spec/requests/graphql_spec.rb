RSpec.describe "Graphql" do
  let(:user) { create(:user) }
  let(:params) { {} }
  let(:headers) { { "Authorization" => "Token #{user.api_token}" } }
  subject { post '/graphql', params, headers }

  describe 'Authentication' do
    context 'failed' do
      let(:headers) { {} }
      specify do
        expect(subject).to eq(401)
      end
    end
    context 'success' do
      specify do
        expect(subject).to eq(200)
      end
    end
  end
end