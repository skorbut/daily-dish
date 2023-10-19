# frozen_string_literal: true

require 'rails_helper'

describe 'user views favorite dish list' do
  context 'with user not logged in' do
    it 'redirects to the login' do
      visit favorite_dishes_path

      expect(page).to have_content('Bitte melde dich zuerst an, um diese Funktion zu nutzen.')
    end
  end

  context 'with user logged in' do
    context 'without favorites' do
      it 'displays an empty list message' do
        login_as(create(:user), scope: :user)

        visit favorite_dishes_path

        expect(page).to have_content('Du hast noch keine Lieblingsgerichte.')
      end
    end

    context 'with user having favorites' do
      it 'shows the dishes name' do
        user = create(:user)
        dish = create(:dish)
        create(:favorite_dish, user: user, dish: dish)
        login_as(user, scope: :user)

        visit favorite_dishes_path

        expect(page).to have_content(dish.name)
      end
    end
  end
end
