RSpec.describe 'routes', type: :routing do
  describe 'root' do
    specify do
      expect(get: '/').to route_to(controller: 'pages', action: 'root')
    end
  end

  describe 'graphql' do
    specify do
      expect(post: '/graphql').to route_to(controller: 'graphqls', action: 'create')
    end
  end
end