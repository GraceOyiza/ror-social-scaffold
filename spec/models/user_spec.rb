require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'Graduation Party')
  end

  it 'will be invalid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  describe 'User associations' do
    it { should have_many(:posts).without_validating_presence }
    it { should have_many(:comments).without_validating_presence }
    it { should have_many(:likes).without_validating_presence }
    it { should have_many(:dislikes).without_validating_presence }
    it { should have_many(:friendships).without_validating_presence }
    it { should have_many(:inverse_friendships).without_validating_presence }
  end
end
