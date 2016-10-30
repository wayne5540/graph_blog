RSpec.describe QueryType do
  let(:user) { create(:user) }

  describe '.fields' do
    subject { described_class.fields }

    specify do
      expect(subject.keys).to match_array(%w(viewer post posts))
    end
  end

  describe '#viewer' do
    subject { described_class.fields['viewer'] }
    
    specify do
      expect(subject.type).to be UserType
    end

    it 'passes current_user from context to UserType' do
      expect(subject.resolve(nil, nil, { current_user: user })).to eq(user)
    end
  end
end