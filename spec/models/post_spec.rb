# frozen_string_literal: true

describe Post do
  subject { create(:post) }

  it 'can be created' do
    is_expected.to be_truthy
  end
end
