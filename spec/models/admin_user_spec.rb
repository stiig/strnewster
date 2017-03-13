# frozen_string_literal: true

describe AdminUser do
  subject { create(:admin_user) }

  it 'can be created' do
    is_expected.to be_truthy
  end
end
