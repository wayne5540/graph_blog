RSpec.describe PostType do
  let(:post) { create(:post) }

  describe '.fields' do
    subject { described_class.fields }
    specify do
      expect(subject.keys).to match_array(%w(id title content updated_at created_at))
    end
  end

  describe '#created_at' do
    subject { described_class.fields['created_at'] }

    specify do
      expect(subject.type).to be GraphQL::INT_TYPE
    end

    specify do
      expect(subject.resolve(post, nil, nil)).to eq(post.created_at.to_i)
    end
  end

  describe '#updated_at' do
    subject { described_class.fields['updated_at'] }

    specify do
      expect(subject.type).to be GraphQL::INT_TYPE
    end

    specify do
      expect(subject.resolve(post, nil, nil)).to eq(post.updated_at.to_i)
    end
  end
end