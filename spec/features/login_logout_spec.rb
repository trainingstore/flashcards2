require "rails_helper"

describe 'user login and logout' do
  let!(:user) { create(:user) }

  context 'restricted access without login' do
    before(:each) do
      visit root_path
    end

    it 'does not have access to create new card' do
      visit '/cards/new'
      expect(page).not_to have_button 'Create flashcard'
    end

    it 'does not have access to edit profile' do
      expect(page).not_to have_content 'Edit profile'
    end

    context 'it has access to pages after login and does not after logout' do
      before(:each) do
        login(user.email, '1234')
        visit root_path
      end

      it 'has access to create new card' do
        visit '/cards/new'
        expect(page).to have_button 'Create flashcard'
      end

      it 'has access to edit profile' do
        expect(page).to have_content 'Edit profile'
      end

      it 'does not have access to create new card after logout' do
        click_link 'Log Out'
        visit '/cards/new'
        expect(page).not_to have_button 'Create flashcard'
      end

      it 'does not have access to edit profile after logout' do
        click_link 'Log Out'
        expect(page).not_to have_content 'Edit profile'
      end
    end
  end
end
