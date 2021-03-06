# frozen_string_literal: true

describe 'main/index.html.slim' do
  it 'should render list of parsed articles' do
    assign(:parsed_articles, create_list(:parsed_article, 10))
    assign(:publics, create_list(:public, 10))
    render
  end
end
