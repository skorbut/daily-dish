# frozen_string_literal: true

require 'rails_helper'

describe 'user logs in' do
  it 'displays login success message' do
    existing_user = create(:user)
    visit new_user_session_path

    submit_form(
      existing_user.name,
      existing_user.password
    )

    expect(page).to have_content('Anmeldung erfolgreich.')
  end

  def submit_form(name, password)
    fill_in :user_name, with: name
    fill_in :user_password, with: password

    click_button('Anmelden')
  end
end
