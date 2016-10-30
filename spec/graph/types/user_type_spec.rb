RSpec.describe UserType do
  let(:user) { create(:user) }

  describe '.fields' do
    subject { described_class.fields }

    specify do
      expect(subject.keys).to match_array(%w(email))
    end
  end

  describe '.interfaces' do
    subject { described_class.interfaces }

    specify do
      expect(subject).to match_array([ActiveRecordInterface])
    end
  end
end