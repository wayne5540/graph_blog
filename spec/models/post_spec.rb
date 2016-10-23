RSpec.describe Post, type: :model do
  describe 'association' do
    it { should belong_to(:user) }
  end
end
