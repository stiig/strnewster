# frozen_string_literal: true
describe FeedSource do
  subject { create(:feed_source) }
  describe 'attributes' do
    context 'title' do
      it('must be presence') { is_expected.to validate_presence_of(:title) }
    end

    context 'url' do
      it('must be presence') { is_expected.to validate_presence_of(:url) }
      it('must be uniq') { is_expected.to validate_uniqueness_of(:url) }
    end

    context 'active' do
      it 'must be presence' do
        expect(subject.valid?).to be true

        subject.active = nil
        expect(subject.valid?).to be false
      end
    end
  end
end
