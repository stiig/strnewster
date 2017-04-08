# frozen_string_literal: true

describe 'news/index.html.slim' do
  it 'should render list of parsed articles' do
    create_list(:parsed_article, 20)
    assign(:parsed_articles, ParsedArticle.page(1).per(10))
    stub_template '_search_form' => 'stubbed paginator'
    render
  end
end
