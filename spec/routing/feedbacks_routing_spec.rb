# frozen_string_literal: true

describe FeedbacksController do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/feedbacks/new').to route_to('feedbacks#new')
    end

    it 'routes to #create' do
      expect(post: '/feedbacks').to route_to('feedbacks#create')
    end
  end
end
