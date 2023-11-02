# frozen_string_literal: true

require 'rails_helper'

describe 'user views dish' do
  context 'with dish created by user' do
    it 'displays the title' do
      user = create(:user)
      login_as(user, scope: :user)
      dish = create(:dish, user:)

      visit dish_path(dish)

      expect(page).to have_css('h1', text: "Details zu #{dish.name}")
    end

    it 'displays formatted markdown' do
      user = create(:user)
      login_as(user, scope: :user)
      dish = create(:dish, user:, hint: '# Einkaufsliste:')

      visit dish_path(dish)

      expect(page).to have_css('h1', text: 'Einkaufsliste:')
    end

    it 'has an outline star' do
      user = create(:user)
      login_as(user, scope: :user)
      dish = create(:dish, user:)

      visit dish_path(dish)

      expect(page).to have_css('i.fa-regular.fa-star')
    end

    it 'has cooked today button' do
      user = create(:user)
      login_as(user, scope: :user)
      dish = create(:dish, user:)

      visit dish_path(dish)

      expect(page).to have_button("Das gab's heute")
    end

    it 'has link to delete dish' do
      user = create(:user)
      login_as(user, scope: :user)
      dish = create(:dish, user:)

      visit dish_path(dish)

      expect(page).to have_link('Löschen')
    end

    it 'has link to edit dish' do
      user = create(:user)
      login_as(user, scope: :user)
      dish = create(:dish, user:)

      visit dish_path(dish)

      expect(page).to have_link('Bearbeiten')
    end
  end

  context 'with dish created by other user' do
    it 'displays the title' do
      user = create(:user)
      login_as(user, scope: :user)
      dish = create(:dish)

      visit dish_path(dish)

      expect(page).to have_css('h1', text: "Details zu #{dish.name}")
    end

    it 'displays formatted markdown' do
      user = create(:user)
      login_as(user, scope: :user)
      dish = create(:dish, hint: '# Einkaufsliste:')

      visit dish_path(dish)

      expect(page).to have_css('h1', text: 'Einkaufsliste:')
    end

    it 'allows to favorite' do
      user = create(:user)
      login_as(user, scope: :user)
      dish = create(:dish)

      visit dish_path(dish)

      expect(page).to have_css('i.fa-regular.fa-star')
    end

    it 'has mark as cooked today' do
      user = create(:user)
      login_as(user, scope: :user)
      dish = create(:dish)

      visit dish_path(dish)

      expect(page).to have_button("Das gab's heute")
    end

    it 'has no link to delete dish' do
      user = create(:user)
      login_as(user, scope: :user)
      dish = create(:dish)

      visit dish_path(dish)

      expect(page).not_to have_link('Löschen')
    end

    it 'has no link to edit dish' do
      user = create(:user)
      login_as(user, scope: :user)
      dish = create(:dish)

      visit dish_path(dish)

      expect(page).not_to have_link('Bearbeiten')
    end
  end

  context 'with a favorite dish' do
    it 'has a solid star' do
      user = create(:user)
      login_as(user, scope: :user)
      dish = create(:dish)
      create(:favorite_dish, user:, dish:)

      visit dish_path(dish)

      expect(page).to have_css('i.fa-solid.fa-star')
    end
  end
end
