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

  describe '.create_for_publication' do
    context 'with right or more amount of ParsedArticles' do
      let!(:articles) { create_list(:parsed_article, 6) }

      it 'should create post with last 5 parsed articles' do
        expect do
          expect(described_class.create_for_publication).to eq Post.last
        end.to change(Post, :count)
        expect(Post.last.last_parsed_article_id).to eq ParsedArticle.offset(5).take.id
      end
    end

    context 'with wrong amount of ParsedArticles' do
      let!(:articles) { create_list(:parsed_article, 4) }

      it 'should return nil and do not create Post' do
        expect do
          expect(described_class.create_for_publication).to be nil
        end.to_not change(Post, :count)
        expect(Post.all).to eq []
      end
    end
  end
end
