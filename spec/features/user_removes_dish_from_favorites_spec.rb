# frozen_string_literal: true

require 'rails_helper'

describe 'user removes dish from favorites', :js do
  context 'with own dish' do
    it 'removes the favorite dish' do
      user = create(:user)
      dish = create(:dish, user:)
      create(:favorite_dish, dish:, user:)

      login_as(user, scope: :user)
      visit dish_path(dish)

      expect { find(:css, 'i.fa-solid.fa-star').click }.to change(FavoriteDish, :count).by(-1)
    end
  end

  context 'with dish from other user' do
    it 'removes the favorite dish' do
      user = create(:user)
      dish = create(:dish)
      create(:favorite_dish, dish:, user:)

      login_as(user, scope: :user)
      visit dish_path(dish)

      expect { find(:css, 'i.fa-solid.fa-star').click }.to change(FavoriteDish, :count).by(-1)
    end
  end
end
