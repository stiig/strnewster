# frozen_string_literal: true
describe Public do
  subject { create(:public) }
  describe 'attribute' do
    context 'outer_id' do
      it 'must be presence' do
        expect(subject.valid?).to be true

        subject.outer_id = nil
        expect(subject.valid?).to be false
      end

      it 'must be uniq' do
        dup = build(:public, outer_id: subject.outer_id)

        expect(dup.valid?).to be false
        expect { dup.save!(validate: false) }.to raise_error ActiveRecord::RecordNotUnique
      end
    end

    context 'width' do
      it('must be presence') { expect(subject).to validate_presence_of(:width) }

      it 'must be number' do
        subject.width = Faker::Lorem.word
        expect(subject.valid?).to be false
      end

      it 'must be integer' do
        subject.width = Faker::Number.decimal(2)
        expect(subject.valid?).to be false
      end

      it 'must be greater that zero' do
        subject.width = Faker::Number.negative.round
        expect(subject.valid?).to be false
      end

      it 'must be default zero' do
        pub = Public.new
        expect(pub.width).to be 0
      end
    end

    context 'height' do
      it('must be presence') { expect(subject).to validate_presence_of(:height) }

      it 'must be number' do
        subject.height = Faker::Lorem.word
        expect(subject.valid?).to be false
      end

      it 'must be integer' do
        subject.height = Faker::Number.decimal(2)
        expect(subject.valid?).to be false
      end

      it 'must be greater that zero' do
        subject.height = Faker::Number.negative.round
        expect(subject.valid?).to be false
      end

      it 'must be default zero' do
        pub = Public.new
        expect(pub.height).to be 0
      end
    end

    context 'mode' do
      it 'must be presence' do
        expect(subject.valid?).to be true

        subject.mode = nil
        expect(subject.valid?).to be false
      end

      it 'must be number' do
        subject.mode = Faker::Lorem.word
        expect(subject.valid?).to be false
      end

      it 'must be integer' do
        subject.mode = Faker::Number.decimal(2)
        expect(subject.valid?).to be false
      end

      it 'must be greater that zero' do
        subject.mode = Faker::Number.negative.round
        expect(subject.valid?).to be false
      end

      it 'must be default zero' do
        pub = Public.new
        expect(pub.mode).to be 0
      end

      it 'must be less or equal 4' do
        subject.mode = 5
        expect(subject.valid?).to be false

        subject.mode = 4
        expect(subject.valid?).to be true
      end
    end

    context 'wide' do
      it 'must be presence' do
        expect(subject.valid?).to be true

        subject.wide = nil
        expect(subject.valid?).to be false
      end

      it 'must be number' do
        subject.wide = Faker::Lorem.word
        expect(subject.valid?).to be false
      end

      it 'must be integer' do
        subject.wide = Faker::Number.decimal(2)
        expect(subject.valid?).to be false
      end

      it 'must be greater that zero' do
        subject.wide = Faker::Number.negative.round
        expect(subject.valid?).to be false
      end

      it 'must be default zero' do
        pub = Public.new
        expect(pub.wide).to be 0
      end

      it 'must be less or equal 1' do
        subject.wide = 2
        expect(subject.valid?).to be false

        subject.wide = 1
        expect(subject.valid?).to be true
      end
    end

    context 'title' do
      it 'must be presence' do
        expect(subject.valid?).to be true

        subject.title = nil
        expect(subject.valid?).to be false
      end
    end
  end
end
