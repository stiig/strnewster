# frozen_string_literal: true

describe 'resources/show.html.slim' do
  let(:feed_source) { create(:feed_source) }

  it 'should render list of parsed articles' do
    create_list(:parsed_article, 20, feed_source: feed_source)
    assign(:resource, feed_source)
    assign(:parsed_articles, feed_source.parsed_articles.page(1).per(10))
    stub_template 'shared/_paginator' => 'stubbed paginator'
    render
  end
end
