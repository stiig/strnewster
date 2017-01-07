# frozen_string_literal: true
describe FeedSource do
  subject { create(:feed_source) }
  describe 'attributes' do
    context 'title' do
      it 'must be presence' do
        expect(subject.valid?).to be true

        subject.title = nil
        expect(subject.valid?).to be false
      end
    end

    context 'url' do
      it 'must be presence' do
        expect(subject.valid?).to be true

        subject.url = nil
        expect(subject.valid?).to be false
      end

      it 'must be uniq' do
        dup = build(:feed_source, url: subject.url)

        expect(dup.valid?).to be false
        expect { dup.save!(validate: false) }.to raise_error ActiveRecord::RecordNotUnique
      end
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
