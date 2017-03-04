# frozen_string_literal: true

describe 'resources/show.html.slim' do
  it 'should render list of parsed articles' do
    assign(:parsed_articles, create_list(:parsed_article, 10))
    assign(:resource, create(:feed_source))
    stub_template 'shared/_paginator' => 'stubbed paginator'
    render
  end
end
