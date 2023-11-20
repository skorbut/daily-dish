# frozen_string_literal: true

require 'rails_helper'

describe 'user removes dish from cooked dishes', :js do
  context 'with own dish' do
    it 'removes the cooked dish' do
      user = create(:user)
      dish = create(:dish, user:)
      create(:cooked_dish, dish:, user:)

      login_as(user, scope: :user)
      visit cooked_dishes_path

      expect { find(:css, 'i.fa-solid.fa-trash').click }.to change(CookedDish, :count).by(-1)
    end
  end

  context 'with dish from other user' do
    it 'removes the favorite dish' do
      user = create(:user)
      dish = create(:dish)
      create(:cooked_dish, dish:, user:)

      login_as(user, scope: :user)
      visit cooked_dishes_path

      expect { find(:css, 'i.fa-solid.fa-trash').click }.to change(CookedDish, :count).by(-1)
    end
  end
end
