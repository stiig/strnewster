# frozen_string_literal: true

describe 'routes for Main page' do
  it 'route / to the Main controller and index action' do
    expect(get: root_path).to route_to(controller: 'main', action: 'index')
    expect(get: '/').to route_to(controller: 'main', action: 'index')
  end
end
