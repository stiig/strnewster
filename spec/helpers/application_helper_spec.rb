# frozen_string_literal: true

describe ApplicationHelper do
  describe '#bootstrap_class_for' do
    it 'should return right class for flash type' do
      expect(helper.bootstrap_class_for('success')).to eq 'alert-success'
      expect(helper.bootstrap_class_for('error')).to eq 'alert-danger'
      expect(helper.bootstrap_class_for('alert')).to eq 'alert-warning'
      expect(helper.bootstrap_class_for('notice')).to eq 'alert-info'
      expect(helper.bootstrap_class_for('unknown')).to eq 'unknown'
    end
  end

  describe '#flash_messages' do
    it 'should return blank html code without flashes' do
      expect(helper.flash_messages).to be nil
    end
  end
end
