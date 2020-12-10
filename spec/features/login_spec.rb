require 'rails_helper'

describe 'the signin process', type: :feature do
  before :each do
    User.create(email: 'daniel1@gmail.com', password: 'Daniel1', name: 'Daniel1')
  end
  it 'signs @user in' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'daniel1@gmail.com'
    fill_in 'Password', with: 'Daniel1'
    click_button 'Log in'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Signed in successfully.')
  end
  it 'does not sign in with wrong info' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'wrong@gmail.com'
    fill_in 'Password', with: 'wrong12'
    click_button 'Log in'
    expect(page).to have_text('Invalid Email or password.')
  end
end
