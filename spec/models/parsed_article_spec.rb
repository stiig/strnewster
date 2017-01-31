# frozen_string_literal: true

describe ParsedArticle do
  subject { create(:parsed_article) }
  describe 'attributes' do
    context 'feed_sourse' do
      it('should be presense') { is_expected.to validate_presence_of(:feed_source) }
      it('should be belong to FeedSource') { is_expected.to belong_to(:feed_source) }
    end

    context 'title' do
      it('should be presense') { is_expected.to validate_presence_of(:title) }
    end

    context 'link' do
      it('should be presense') { is_expected.to validate_presence_of(:link) }
    end

    context 'date' do
      it('should be presense') { is_expected.to validate_presence_of(:date) }
    end
  end
end
