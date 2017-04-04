# frozen_string_literal: true

describe 'news/index.html.slim' do
  it 'should render list of parsed articles' do
    assign(:parsed_articles, create_list(:parsed_article, 20))
    stub_template 'shared/_paginator' => 'stubbed paginator'
    stub_template '_search_form' => 'stubbed paginator'
    render
  end
end
