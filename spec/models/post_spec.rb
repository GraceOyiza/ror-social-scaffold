require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    described_class.new(content: 'Graduation Party')
  end

  it 'will be invalid without a content' do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  describe 'Post associations' do
    it { should have_many(:comments).without_validating_presence }
    it { should have_many(:likes).without_validating_presence }
  end
end
