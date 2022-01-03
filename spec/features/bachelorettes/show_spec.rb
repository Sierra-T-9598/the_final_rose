require 'rails_helper'

RSpec.describe 'Bachelorette Show Page' do
  before(:each) do
    @bachelorette_1 = Bachelorette.create!(name: "Hannah", season_number: 3, description: "The Most Dramatic Season Yet!")
    @bachelorette_2 = Bachelorette.create!(name: "Lily", season_number: 5, description: "The Most Romantic Season Yet!")
    @contestant_1 = @bachelorette_1.contestants.create!(name: "Joey", age: 31, hometown: 'Charlestown')
    @contestant_2 = @bachelorette_1.contestants.create!(name: "Marcus", age: 26, hometown: 'Pittsburg')
    @contestant_3 = @bachelorette_1.contestants.create!(name: "Georgie", age: 28, hometown: 'Sandpoint')
    @contestant_4 = @bachelorette_2.contestants.create!(name: "Mike", age: 24, hometown: 'Bellingham')

    visit bachelorette_path(@bachelorette_1.id)
  end

  scenario 'visitor sees that bachelorettes name, season num, and descirption of season' do
    expect(page).to have_content(@bachelorette_1.name)
    expect(page).to have_content(@bachelorette_1.season_number)
    expect(page).to have_content(@bachelorette_1.description)
  end

  scenario 'visitor sees link to see bachelorettes contestants' do
    expect(page).to have_link('See my contestants')
  end

  scenario 'visitor clicks link and sees new page with only that bachelorettes contestants' do
    click_on 'See my contestants'

    expect(current_path).to eq("/bachelorettes/#{@bachelorette_1.id}/contestants")
    expect(page).to have_content(@contestant_1.name)
    expect(page).to have_content(@contestant_2.name)
    expect(page).to have_content(@contestant_3.name)
    expect(page).to_not have_content(@contestant_4.name)
  end

  scenario 'visitor sees average age of all of that bachelorettes contestants' do
    expect(page).to have_content("Average Age of Contestants: #{@bachelorette_1.contestants_average_age}")
  end
end
