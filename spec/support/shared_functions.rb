# frozen_string_literal: true

module Support
  module SharedFunctions
    def change_all_requests_local(param)
      Rails.application.config.consider_all_requests_local = param
      Strnewster::Application.reload_routes!
      yield
      Rails.application.config.consider_all_requests_local = !param
      Strnewster::Application.reload_routes!
    end
  end
end
