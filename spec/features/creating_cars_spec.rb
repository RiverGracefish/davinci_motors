require 'rails_helper'

feature 'Creating Cars' do
  scenario 'can create a car' do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('1967 Ford Mustang created')
    expect(page).to have_content('$2,300.00')
  end

  scenario 'can create second car' do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Toyota'
    fill_in 'Model', with: 'Camry'
    fill_in 'Year', with: '1969'
    fill_in 'Price', with: '1200'

    click_button 'Create Car'

    expect(page).to have_content('1969 Toyota Camry created')
    expect(page).to have_content('$2,300.00')
    expect(page).to have_content('$1,200.00')
  end
end
