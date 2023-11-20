# frozen_string_literal: true

require 'rails_helper'

describe 'dish post spec' do
  context 'with other users dish' do
    it 'redirects to show path' do
      owner = create(:user, name: 'fuchs')
      user = create(:user)
      dish = create(:dish, user: owner)

      login_as(user, scope: :user)

      patch "/dishes/#{dish.id}", params: { dish: { name: 'Gulasch', hint: 'lecker' } }

      expect(response).to redirect_to(dish_path(dish))
    end

    it 'displays an alert' do
      owner = create(:user, name: 'fuchs')
      user = create(:user)
      dish = create(:dish, user: owner)

      login_as(user, scope: :user)

      patch "/dishes/#{dish.id}", params: { dish: { name: 'Gulasch', hint: 'lecker' } }

      expect(flash[:alert]).to eq 'Du kannst nicht das Gericht von fuchs bearbeiten'
    end
  end
end
