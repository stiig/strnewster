# frozen_string_literal: true

describe 'feedbacks/new' do
  before(:each) do
    assign(:feedback, build(:feedback))
  end

  it 'renders new feedback form' do
    render

    assert_select 'form[action=?][method=?]', feedbacks_path, 'post' do
      assert_select 'input#feedback_contact[name=?]', 'feedback[contact]'

      assert_select 'textarea#feedback_message[name=?]', 'feedback[message]'
    end
  end
end
