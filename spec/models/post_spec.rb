# frozen_string_literal: true

describe Post do
  subject { create(:post) }

  it 'can be created' do
    is_expected.to be
  end

  it 'must have status created by default' do
    is_expected.to respond_to(:status, :created?, :published?, :created!, :published!)
    expect(subject.created?).to be_truthy
    expect(subject.published?).to be_falsey
  end
end
