# frozen_string_literal: true

describe 'routes for Main page' do
  it 'route / to the Main controller and index action' do
    expect(get: root_path).to route_to(controller: 'main', action: 'index')
    expect(get: '/').to route_to(controller: 'main', action: 'index')
  end

  it 'unknown route /unknown_path to Application controller and error_404 action' do
    change_all_requests_local(false) do
      expect(get: '/unknown_path').to route_to(controller: 'application',
                                               action: 'error_404', path: 'unknown_path')
    end
  end
end
