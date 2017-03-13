# frozen_string_literal: true

describe User do
  subject { create(:user) }

  it 'can be created' do
    is_expected.to be_truthy
  end
end
