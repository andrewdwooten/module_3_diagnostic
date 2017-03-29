require 'rails_helper'

feature 'user visits root' do
  scenario 'user sees a form' do
    visit '/'

    expect(page).to have_content('Welcome')
    expect(page).to have_css('.form-inline')
  end

  scenario 'user searches for stations' do
    VCR.use_cassette('features/user_search/search_by_zip') do
      visit '/'

      fill_in "q", with: '80203'
      click_button('Locate')

      expect(current_path).to eq('/search')
      expect(page).to have_css('#results_table')
      expect(page).to have_content('JOULE')
      expect(page).to have_content('24 hours daily')
      expect(page).to have_content('1000 Speer Blvd, Denver')
      expect(page).to have_content('ELEC')
    end
  end
end
