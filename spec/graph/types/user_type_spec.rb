RSpec.describe 'UserType' do
  let(:user) { create(:user) }
  let(:user_type) { Schema.types["User"] }

  describe '.fields' do
    subject { user_type.fields }
    specify do
      expect(subject.keys).to match_array(%w(id email updated_at created_at))
    end
  end

  describe '#created_at' do
    subject { user_type.fields['created_at'] }

    specify do
      expect(subject.type).to be GraphQL::INT_TYPE
    end

    specify do
      expect(subject.resolve(user, nil, nil)).to eq(user.created_at.to_i)
    end
  end

  describe '#updated_at' do
    subject { user_type.fields['updated_at'] }

    specify do
      expect(subject.type).to be GraphQL::INT_TYPE
    end

    specify do
      expect(subject.resolve(user, nil, nil)).to eq(user.updated_at.to_i)
    end
  end
end