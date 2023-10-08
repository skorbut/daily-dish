# frozen_string_literal: true

require 'rails_helper'

describe 'user registers new account' do
  it 'creates a new user in the database' do
    visit new_user_registration_path

    # enter user data
    password = Faker::Internet.password(min_length: 8)

    expect { submit_form(Faker::Name.unique.first_name, Faker::Internet.unique.email, password) }.to change(User, :count).by(1)
  end

  it 'has the expected values' do
    visit new_user_registration_path

    password = Faker::Internet.password(min_length: 8)
    name = Faker::Name.unique.first_name
    email = Faker::Internet.unique.email

    submit_form(name, email, password)

    created_user = User.first
    expect(created_user.name).to eq name.downcase
    expect(created_user.email).to eq email
  end

  def submit_form(name, email, password)
    fill_in :user_name, with: name
    fill_in :user_email, with: email

    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: password

    click_button('Benutzer anlegen')
  end
end
