RSpec.describe User, type: :model do
  describe 'association' do
    it { should have_many(:posts) }
  end

  describe 'has_secure_token' do
    let(:user) { create(:user) }

    specify do
      expect(user.api_token).to be_present
    end
  end
end
