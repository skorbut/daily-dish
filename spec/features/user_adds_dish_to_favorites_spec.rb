# frozen_string_literal: true

require 'rails_helper'

describe 'user adds dish to favorites', :js do
  context 'with dish created by user' do
    it 'creates a new favorite dish model' do
      user = create(:user)
      login_as(user, scope: :user)
      dish = create(:dish, user:)

      visit dish_path(dish)

      expect { find(:css, 'i.fa-regular.fa-star').click }.to change(FavoriteDish, :count).by(1)
    end
  end

  context 'with dish created by other user', :js do
    it 'creates a new favorite dish' do
      user = create(:user)
      login_as(user, scope: :user)
      dish = create(:dish)

      visit dish_path(dish)

      expect { find(:css, 'i.fa-regular.fa-star').click }.to change(FavoriteDish, :count).by(1)
    end
  end
end
