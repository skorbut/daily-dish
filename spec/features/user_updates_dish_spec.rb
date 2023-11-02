# frozen_string_literal: true

require 'rails_helper'

describe 'user updates a dish' do
  context 'with user not logged in' do
    it 'redirects to the login' do
      dish = create(:dish)
      visit edit_dish_path(dish.id)

      expect(page).to have_content('Bitte melde dich zuerst an, um diese Funktion zu nutzen.')
    end
  end

  context 'with a dish of a different user' do
    it 'prevents editing' do
      owner = create(:user, name: 'fuchs')
      user = create(:user)
      dish = create(:dish, user: owner)

      login_as(user, scope: :user)
      visit edit_dish_path(dish.id)

      expect(page).to have_content('Du kannst nicht das Gericht von fuchs bearbeiten')
    end
  end
end
