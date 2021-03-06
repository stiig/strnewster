# frozen_string_literal: true

module SharedFunctions
  def change_all_requests_local(param)
    Rails.application.config.consider_all_requests_local = param
    Strnewster::Application.reload_routes!
    yield
    Rails.application.config.consider_all_requests_local = !param
    Strnewster::Application.reload_routes!
  end
end

RSpec.configure do |config|
  config.include SharedFunctions
end
