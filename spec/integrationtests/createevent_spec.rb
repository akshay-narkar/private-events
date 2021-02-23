describe 'Event Management', type: :system do
  before(:all) do
    User.create(username: 'michaels')
  end
  before(:all) do
    reset_session!
  end

  feature 'Create event without login' do
    scenario 'they try to create event without logging in' do
      visit new_event_path
      #   fill_in '_userlogin_username', with: 'michaels'
      #   click_button 'Login'
      expect(page).to have_content('Login')
    end
  end
  feature 'Login as a new user' do
    scenario 'they are on login page and try to login in and succeeds and can create a new event' do
      visit new_session_path
      fill_in '_userlogin_username', with: 'michaels'
      click_button 'Login'
      click_link 'Create Event'
      fill_in '_event123_description', with: 'Test Event Capy'
      fill_in '_event123_eventdate', with: '23/02/2021'
      click_button 'Create'
      expect(page).to have_content('Test Event Capy')
    end
  end
end
