# frozen_string_literal: true

require 'rails_helper'

describe 'user visits home' do
  context 'without login' do
    context 'with a dish in the database' do
      it 'sees the random dish' do
        random_dish = create(:dish)
        visit root_path

        expect(page).to have_content('Zufallsgericht unserer Nutzer')
        expect(page).to have_content(random_dish.name)
      end
    end

    context 'without dishes' do
      it 'does not see the random dish section' do
        visit root_path

        expect(page).not_to have_content('Zufallsgericht unserer Nutzer')
      end
    end

    it 'sees the description' do
      visit root_path

      expect(page).to have_content('Dies ist ein kleines Projekt zur gemeinschaftlichen Sammlung von Rezeptideen, um am Wochenende nicht immer das Gleiche zu kochen.')
    end

    it 'sees the usage' do
      visit root_path

      expect(page).to have_content('Angemeldete Nutzer haben die Möglichkeit selbst Gerichte zum Bestand hinzuzufügen und daraus Favoritenlisten zu bilden. Weiterhin gibt es die Möglichkeit zu speichern, wann es ein bestimmtes Gericht gab.')
    end

    it 'sees register and login link' do
      visit root_path

      expect(page).to have_link('Registrieren')
      expect(page).to have_link('Anmelden')
    end

    it 'does not see the dish specific links' do
      visit root_path

      expect(page).not_to have_link('Neues Gericht')
      expect(page).not_to have_link('Alle Gerichte')
      expect(page).not_to have_link('Meine Gerichte')
      expect(page).not_to have_link('Lieblingsgerichte')
      expect(page).not_to have_link('Kochkalender')
    end

    it 'does not see the logout link' do
      visit root_path

      expect(page).not_to have_link('Abmelden')
    end
  end

  context 'with user logged in' do
    context 'with a dish in the database' do
      it 'sees the random dish' do
        random_dish = create(:dish)
        sign_in(create(:user))
        visit root_path

        expect(page).to have_content('Zufallsgericht unserer Nutzer')
        expect(page).to have_content(random_dish.name)
      end
    end

    context 'without dishes' do
      it 'does not see the random dish section' do
        sign_in(create(:user))
        visit root_path

        expect(page).not_to have_content('Zufallsgericht unserer Nutzer')
      end
    end

    it 'sees the description' do
      sign_in(create(:user))
      visit root_path

      expect(page).to have_content('Dies ist ein kleines Projekt zur gemeinschaftlichen Sammlung von Rezeptideen, um am Wochenende nicht immer das Gleiche zu kochen.')
    end

    it 'sees the usage' do
      sign_in(create(:user))
      visit root_path

      expect(page).to have_content('Angemeldete Nutzer haben die Möglichkeit selbst Gerichte zum Bestand hinzuzufügen und daraus Favoritenlisten zu bilden. Weiterhin gibt es die Möglichkeit zu speichern, wann es ein bestimmtes Gericht gab.')
    end

    it 'does not see the register and login link' do
      sign_in(create(:user))
      visit root_path

      expect(page).not_to have_link('Registrieren')
      expect(page).not_to have_link('Anmelden')
    end

    it 'sees the logout link' do
      sign_in(create(:user))
      visit root_path

      expect(page).to have_link('Abmelden')
    end

    it 'sees the dish specific links' do
      sign_in(create(:user))
      visit root_path

      expect(page).to have_link('Neues Gericht')
      expect(page).to have_link('Alle Gerichte')
      expect(page).to have_link('Meine Gerichte')
      expect(page).to have_link('Lieblingsgerichte')
      expect(page).to have_link('Kochkalender')
    end
  end

  def sign_in(user)
    login_as(user, scope: :user)
  end
end
