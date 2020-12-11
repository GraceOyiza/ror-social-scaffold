require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    described_class.new(content: 'Graduation Party')
  end

  it 'will be invalid without a content' do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  describe 'Comment associations' do
    it { should belong_to(:user).without_validating_presence }
    it { should belong_to(:post).without_validating_presence }
  end
end
