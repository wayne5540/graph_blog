RSpec.describe ActiveRecordInterface do
  describe '.fields' do
    subject { described_class.fields }

    specify do
      expect(subject.keys).to match_array(%w(id updated_at created_at))
    end
  end

  describe '#id' do
    subject { described_class.fields['created_at'] }

    specify do
      expect(subject.type).to be GraphQL::INT_TYPE
    end
  end

  describe '#created_at' do
    subject { described_class.fields['created_at'] }

    specify do
      expect(subject.type).to be GraphQL::INT_TYPE
    end
  end

  describe '#updated_at' do
    subject { described_class.fields['updated_at'] }

    specify do
      expect(subject.type).to be GraphQL::INT_TYPE
    end
  end
end