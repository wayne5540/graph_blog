RSpec.describe MutationType do
  describe '.fields' do
    subject { described_class.fields }

    specify do
      expect(subject.keys).to match_array(%w(createPost))
    end
  end
end