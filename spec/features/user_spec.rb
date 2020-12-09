require 'rails_helper'

describe 'signin procedure', type: :feature do
  before :each do
    User.create(email: 'grace@gmail.com', password: 'password_grace', name: 'Grace')
    User.create(email: 'daniel@gmail.com', password: 'password_daniel', name: 'Daniel')
    visit '/users/sign_in'
    fill_in 'Email', with: 'grace@gmail.com'
    fill_in 'Password', with: 'password_grace'
    click_button 'Log in'
  end

  it 'checks the users page' do
    visit users_path
    expect(page).to have_text('Grace')
    expect(page).to have_link('See Profile')
  end

  it 'sends an invite to friendship to user2, Daniel' do
    visit users_path
    expect(page).to have_link('Invite to friendship')
    click_link 'Invite to friendship'
    expect(page).to have_link('pending friendship')
  end
end
