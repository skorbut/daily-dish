# frozen_string_literal: true

require 'rails_helper'

describe 'user views dish' do
  context 'with user not logged in' do
    it 'redirects to the login' do
      visit new_dish_path

      expect(page).to have_content('Bitte melde dich zuerst an, um diese Funktion zu nutzen.')
    end
  end

  context 'with user logged in' do
    it 'provides the expected fields' do
      user = create(:user)
      login_as(user, scope: :user)

      visit new_dish_path

      expect(page).to have_field('dish_name')
      expect(page).to have_field('dish_hint')
      expect(page).to have_button('Gericht anlegen')
    end

    it 'creates a new dish' do
      user = create(:user)
      login_as(user, scope: :user)

      visit new_dish_path

      expect do
        submit_form('Gulasch', 'ein paar Tipps')
      end.to change(Dish, :count).by(1)
    end

    it 'has the expected attributes' do
      user = create(:user)
      login_as(user, scope: :user)

      visit new_dish_path

      submit_form('Gulasch', 'ein paar Tipps')

      expect(Dish.first.name).to eq 'Gulasch'
      expect(Dish.first.hint).to eq 'ein paar Tipps'
    end
  end

  context 'without entering data' do
    it 'does not create a new dish' do
      user = create(:user)
      login_as(user, scope: :user)

      visit new_dish_path

      expect do
        submit_form(nil, nil)
      end.not_to change(Dish, :count)
    end

    it 'displays an error message' do
      user = create(:user)
      login_as(user, scope: :user)

      visit new_dish_path

      submit_form(nil, nil)
      expect(page).to have_content('Name muss ausgefüllt werden')
    end
  end

  def submit_form(name, hint)
    fill_in :dish_name, with: name
    fill_in :dish_hint, with: hint

    click_button('Gericht anlegen')
  end
end
