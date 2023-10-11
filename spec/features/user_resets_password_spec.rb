# frozen_string_literal: true

require 'rails_helper'

# since we do not have a mail server attached the process starts with the user
# accessing the reset password page by the link provided by the site admin.

describe 'user resets password' do
  context 'with a valid token' do
    context 'with a valid new password' do
      it 'displays a success message after change' do
        user = create(:user, password: 'old_password')
        # set new reset password token at user
        token = user.send(:set_reset_password_token)
        visit edit_user_password_path(user, reset_password_token: token)

        submit_password_change('new_password')

        expect(page).to have_content('Das Passwort wurde zurückgesetzt. Anmeldung erfolgreich.')
      end

      it 'stores a new password in the database' do
        user = create(:user, password: 'old_password')
        # set new reset password token at user
        token = user.send(:set_reset_password_token)
        visit edit_user_password_path(user, reset_password_token: token)

        expect { submit_password_change('new_password') }.to(change { User.find(user.id).encrypted_password })
      end
    end
  end

  context 'without token' do
    it 'shows the expected message' do
      user = create(:user, password: 'old_password')
      visit edit_user_password_path(user, reset_password_token: nil)

      expect(page).to have_content('Die eingebene Adresse zum Zurücksetzen des Passwortes war unvollständig. Bitte kopiere den gesamten Link.')
    end

    it 'redirects to the login page' do
      user = create(:user, password: 'old_password')
      visit edit_user_password_path(user, reset_password_token: nil)

      expect(page).to have_content('Benutzer anmelden')
    end
  end

  context 'with an expired token' do
    it 'shows the expected message' do
      user = create(:user, password: 'old_password')
      # set new reset password token at user
      token = user.send(:set_reset_password_token)
      user.update(reset_password_sent_at: 2.days.ago)
      visit edit_user_password_path(user, reset_password_token: token)

      submit_password_change('new_password')

      expect(page).to have_content('Passwort Zurücksetzen Token ist abgelaufen. Bitte fordere einen neuen Link an, um das Passwort zurückzusetzen.')
    end
  end

  def submit_password_change(new_password)
    fill_in :user_password, with: new_password
    fill_in :user_password_confirmation, with: new_password

    click_button('Passwort speichern')
  end
end
