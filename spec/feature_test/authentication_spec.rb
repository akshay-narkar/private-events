describe 'Session authentication', type: :system do
  before(:all) do
    User.create(username: 'michaels')
  end

  context 'Login as a new user' do
    it 'they are on login page and try to login in and succeeds' do
      visit new_session_path

      fill_in '_userlogin_username', with: 'michaels'
      click_button 'Login'

      expect(page).to have_content('All Events')
    end
  end

  context 'Create a new user' do
    it 'they are on login page and try to login in and login fails' do
      visit new_session_path

      fill_in '_userlogin_username', with: 'akshay'
      click_button 'Login'

      expect(page).to have_content('Invalid Username')
    end
  end

  context 'Login and logout a new user' do
    it 'they are on login page and try to login in and login fails' do
      visit new_session_path

      fill_in '_userlogin_username', with: 'michaels'
      click_button 'Login'
      click_link 'Logout'
      expect(page).to have_content('All Events')
    end
  end
end
