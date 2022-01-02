require 'rails_helper'

RSpec.describe 'Bachelorette Show Page' do
  before(:each) do
    @bachelorette_1 = Bachelorette.create!(name: "Hannah", season_number: 3, description: "The Most Dramatic Season Yet!")
    visit bachelorette_path(@bachelorette_1.id)
  end

  scenario 'visitor sees that bachelorettes name, season num, and descirption of season' do
    expect(page).to have_content(@bachelorette_1.name)
    expect(page).to have_content(@bachelorette_1.season_number)
    expect(page).to have_content(@bachelorette_1.description)
    save_and_open_page
  end
end
