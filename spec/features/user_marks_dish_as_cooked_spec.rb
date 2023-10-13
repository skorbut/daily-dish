# frozen_string_literal: true

require 'rails_helper'

describe 'user_marks_dish_as_cooked' do
  it 'creates a cooked_dish entry' do
    user = create(:user)
    dish = create(:dish)
    login_as(user, scope: :user)

    visit dish_path(dish)

    expect { click_button("Das gab's heute") }.to change(CookedDish, :count).by(1)
  end
end
