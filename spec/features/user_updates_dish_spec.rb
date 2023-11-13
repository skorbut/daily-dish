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

  context 'with a user editing own dish' do
    it 'has the expected fields' do
      owner = create(:user, name: 'fuchs')
      dish = create(:dish, user: owner)

      login_as(owner, scope: :user)
      visit edit_dish_path(dish.id)

      expect(page).to have_field('dish_name')
      expect(page).to have_field('dish_hint')
      expect(page).to have_button('Gericht aktualisieren')
    end
  end

  context 'with a user updating own dish' do
    it 'updates the same dish' do
      owner = create(:user, name: 'fuchs')
      dish = create(:dish, user: owner)

      login_as(owner, scope: :user)
      visit edit_dish_path(dish.id)

      expect do
        submit_form('Gulasch', 'ein paar Tipps')
      end.not_to change(Dish, :count)
    end

    it 'has the expected attributes' do
      owner = create(:user, name: 'fuchs')
      dish = create(:dish, user: owner)

      login_as(owner, scope: :user)
      visit edit_dish_path(dish.id)

      submit_form('Gulasch', 'ein paar Tipps')

      expect(Dish.first.name).to eq 'Gulasch'
      expect(Dish.first.hint).to eq 'ein paar Tipps'
    end
  end

  def submit_form(name, hint)
    fill_in :dish_name, with: name
    fill_in :dish_hint, with: hint

    click_button('Gericht aktualisieren')
  end
end
