require 'rails_helper'

feature 'user visits root' do
  scenario 'user sees a form' do
    visit '/'

    expect(page).to have_content('Welcome')
    expect(page).to have_css('.form-inline')
  end

  scenario 'user searches for stations' do
    visit '/'

    fill_in "q", with: '80203'
    click_button('Locate')
    expect(page).to have_content('Welcome')
  end
end
