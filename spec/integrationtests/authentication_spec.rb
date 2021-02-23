describe 'Session authentication', type: :system do
  before(:all) do
    User.create(username: 'michaels')
  end

  feature 'Login as a new user' do
    scenario 'they are on login page and try to login in and succeeds' do
      visit new_session_path

      fill_in '_userlogin_username', with: 'michaels'
      click_button 'Login'

      expect(page).to have_content('All Events')
    end
  end

  feature 'Create a new user' do
    scenario 'they are on login page and try to login in and login fails' do
      visit new_session_path

      fill_in '_userlogin_username', with: 'akshay'
      click_button 'Login'

      expect(page).to have_content('Invalid Username')
    end
  end

  feature 'Login and logout a new user' do
    scenario 'they are on login page and try to login in and login fails' do
      visit new_session_path

      fill_in '_userlogin_username', with: 'michaels'
      click_button 'Login'
      click_link 'Logout'
      #   find(:xpath, '/html/body/nav/div/div/div/div/a[2]', text: 'Logout').click
      expect(page).to have_content('All Events')
    end
  end
end
