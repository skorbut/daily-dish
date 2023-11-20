# frozen_string_literal: true

require 'rails_helper'

describe 'user deletes a dish' do
  context 'with a dish of a different user' do
    it 'has no delete button' do
      owner = create(:user, name: 'fuchs')
      user = create(:user)
      dish = create(:dish, user: owner)

      login_as(user, scope: :user)
      visit dish_path(dish.id)

      expect(page).not_to have_link('Löschen')
    end
  end

  context 'with own dish' do
    it 'has a delete button' do
      owner = create(:user, name: 'fuchs')
      dish = create(:dish, user: owner)

      login_as(owner, scope: :user)
      visit dish_path(dish.id)

      expect(page).to have_link('Löschen')
    end

    it 'redirects to the dishes index' do
      owner = create(:user, name: 'fuchs')
      dish = create(:dish, user: owner)

      login_as(owner, scope: :user)
      visit dish_path(dish.id)

      execute_delete

      expect(page).to have_content("Es hat noch niemand ein Gericht angelegt, schnell leg' eins an.")
    end
  end

  def execute_delete
    accept_confirm do
      click_link 'Löschen'
    end
  end
end
