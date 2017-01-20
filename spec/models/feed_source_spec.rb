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

  describe 'scopes' do
    context 'when default scope' do
      it 'shoult contain all objects' do
        create_list(:feed_source, 10)
        expect(described_class.all.size).to eq(10)
      end
    end

    context 'when activated' do
      it 'should contain only activated' do
        subject.active = true
        subject.save
        expect(described_class.activated.size).to eq(1)
        create_list(:feed_source, 9, active: true)
        create_list(:feed_source, 5, active: false)
        expect(described_class.activated.size).to eq(10)
        expect(described_class.all.size).to eq(15)
      end
    end
  end
end
