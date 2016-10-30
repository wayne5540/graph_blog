RSpec.describe "Graphql" do
  describe 'POST /graphql' do
    let(:user) { create(:user) }
    let(:params) { { query: "", variables: '{"hello": "world"}' } }
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

    describe 'execute Schema' do
      let(:options) do
        {
          variables: JSON.load(params[:variables]),
          context: { current_user: user }
        }
      end
      specify do
        expect(Schema).to receive(:execute).with(params[:query], options)

        subject
      end
    end
  end
end