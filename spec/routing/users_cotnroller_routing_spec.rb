require 'spec_helper'

describe UsersController do
	describe 'routing' do
		it {{ get: '/users'}.should route_to(controller: 'users', action: 'index')}
		it {{ get: '/users/10'}.should route_to(controller: 'users', action: 'show', id: '10')}
		it {{ post: '/users'}.should route_to(controller: 'users', action: 'create')}
		it {{ put: 'users/10'}.should route_to(controller: 'users', action: 'update', id: '10')}
	end
end