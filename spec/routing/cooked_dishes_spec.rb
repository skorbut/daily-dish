# frozen_string_literal: true

require 'rails_helper'

describe 'routes for cooked dishes' do
  it 'does not route to new cooked_dish' do
    expect(get: '/cooked_dishes/new').not_to be_routable
  end

  it 'routes the create action' do
    expect(post: '/cooked_dishes').to route_to('cooked_dishes#create')
  end

  it 'routes the destroy action' do
    expect(delete: '/cooked_dishes/12').to route_to(controller: 'cooked_dishes', action: 'destroy', id: '12')
  end
end
