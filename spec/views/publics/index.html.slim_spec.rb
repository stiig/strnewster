# frozen_string_literal: true

describe 'publics/index.html.slim' do
  it 'should render list of publics' do
    assign(:publics, create_list(:public, 20))
    render
  end
end
