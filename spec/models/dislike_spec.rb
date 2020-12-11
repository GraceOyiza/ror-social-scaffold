require 'rails_helper'

RSpec.describe Dislike, type: :model do
  subject do
    described_class.new(user_id: 'Graduation Party')
  end

  it 'will be invalid without a content' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  describe 'Disike associations' do
    it { should belong_to(:post).without_validating_presence }
    it { should belong_to(:user).without_validating_presence }
  end
end
