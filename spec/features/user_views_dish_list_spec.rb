# frozen_string_literal: true

require 'rails_helper'

describe 'user views dish list' do
  context 'without dishes' do
    it 'has no random dish' do
      login_as(create(:user), scope: :user)

      visit dishes_path

      expect(page).not_to have_content('Empfehlung des Hauses')
    end

    it 'displays an empty list message' do
      login_as(create(:user), scope: :user)

      visit dishes_path

      expect(page).to have_content("Es hat noch niemand ein Gericht angelegt, schnell leg' eins an.")
    end
  end

  context 'with exactly one dish' do
    it 'is the random dish' do
      user = create(:user)
      login_as(create(:user), scope: :user)
      create(:dish, user:)

      visit dishes_path

      expect(page).to have_content('Empfehlung des Hauses')
    end

    it 'displays the dishes list' do
      user = create(:user)
      login_as(create(:user), scope: :user)
      create(:dish, user:)

      visit dishes_path

      expect(page).to have_content('Gerichte')
    end

    it 'displays the same dish in both lists' do
      user = create(:user)
      login_as(create(:user), scope: :user)
      random_dish = create(:dish, user:)

      visit dishes_path

      expect(page).to have_content(random_dish.name, count: 2)
    end

    it 'the dish from the list is a link' do
      user = create(:user)
      login_as(create(:user), scope: :user)
      random_dish = create(:dish, user:)

      visit dishes_path

      expect(page).to have_link(random_dish.name, href: dish_path(random_dish))
    end
  end
end
