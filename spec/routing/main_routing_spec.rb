# frozen_string_literal: true

describe 'routes for Main page' do
  it 'route / to the Main controller and index action' do
    expect(get: root_path).to route_to(controller: 'main', action: 'index')
    expect(get: '/').to route_to(controller: 'main', action: 'index')
  end

  it 'unkown route /unkwon_path to Application controller and error_404 action' do
    change_all_requests_local(false)
    allow(Rails.application.config).to receive(:consider_all_requests_local).and_return(true)
    expect(get: '/unkwon_path').to route_to(controller: 'application', action: 'error_404', path: 'unkwon_path')
    change_all_requests_local(true)
  end

  private

  def change_all_requests_local(param)
    Rails.application.config.consider_all_requests_local = param
    Strnewster::Application.reload_routes!
  end
end
