RSpec.describe 'QueryType' do
  let(:user) { create(:user) }
  let(:user_type) { Schema.types["Query"] }

  describe '.fields' do
    subject { user_type.fields }

    specify do
      expect(subject.keys).to match_array(%w(viewer))
    end
  end

  describe '#viewer' do
    subject { user_type.fields['viewer'] }
    
    specify do
      expect(subject.type).to be UserType
    end

    it 'passes current_user from context to UserType' do
      expect(subject.resolve(nil, nil, { current_user: user })).to eq(user)
    end
  end
end