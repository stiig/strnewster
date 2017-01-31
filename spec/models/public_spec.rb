# frozen_string_literal: true

describe Public do
  subject { create(:public) }
  describe 'attribute' do
    context 'outer_id' do
      it('must be presence') { is_expected.to validate_presence_of(:outer_id) }
      it('must be uniq') { is_expected.to validate_uniqueness_of(:outer_id).case_insensitive }
    end

    context 'width' do
      it('must be presence') { is_expected.to validate_presence_of(:width) }
      it 'must be integer number great than 0' do
        is_expected.to validate_numericality_of(:width)
          .only_integer
          .is_greater_than_or_equal_to(0)
      end

      it 'must be default zero' do
        pub = Public.new
        expect(pub.width).to be 0
      end
    end

    context 'height' do
      it('must be presence') { is_expected.to validate_presence_of(:height) }

      it 'must be integer number great than 0' do
        is_expected.to validate_numericality_of(:height)
          .only_integer
          .is_greater_than_or_equal_to(0)
      end

      it 'must be default zero' do
        pub = Public.new
        expect(pub.height).to be 0
      end
    end

    context 'mode' do
      it('must be presence') { is_expected.to validate_presence_of(:mode) }

      it 'must be integer number great than 0 and less 4' do
        is_expected.to validate_numericality_of(:mode)
          .only_integer
          .is_greater_than_or_equal_to(0)
          .is_less_than_or_equal_to(4)
      end

      it 'must be default zero' do
        pub = Public.new
        expect(pub.mode).to be 0
      end
    end

    context 'wide' do
      it('must be presence') { is_expected.to validate_presence_of(:wide) }

      it 'must be integer number great than 0 and less 1' do
        is_expected.to validate_numericality_of(:wide)
          .only_integer
          .is_greater_than_or_equal_to(0)
          .is_less_than_or_equal_to(1)
      end

      it 'must be default zero' do
        pub = Public.new
        expect(pub.wide).to be 0
      end
    end

    context 'title' do
      it('must be presence') { is_expected.to validate_presence_of(:title) }
    end
  end
end
