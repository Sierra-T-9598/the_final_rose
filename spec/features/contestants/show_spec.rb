require 'rails_helper'

RSpec.describe 'Contestant Show Page' do
  before(:each) do
    @bachelorette_1 = Bachelorette.create!(name: "Hannah", season_number: 3, description: "The Most Dramatic Season Yet!")
    @bachelorette_2 = Bachelorette.create!(name: "Lily", season_number: 5, description: "The Most Romantic Season Yet!")
    @contestant_1 = @bachelorette_1.contestants.create!(name: "Joey", age: 31, hometown: 'Charlestown')
    @contestant_2 = @bachelorette_1.contestants.create!(name: "Marcus", age: 26, hometown: 'Pittsburg')
    @contestant_3 = @bachelorette_1.contestants.create!(name: "Georgie", age: 28, hometown: 'Sandpoint')
    @contestant_4 = @bachelorette_2.contestants.create!(name: "Mike", age: 24, hometown: 'Bellingham')

    visit contestant_path(@contestant_3.id)
  end

  scenario 'visitor sees contestant name' do
    expect(page).to have_content(@contestant_3.name)
  end

  scenario 'visitor sees season number and season description that contestant was on' do
    # require "pry"; binding.pry
    expect(page).to have_content("Season #{@bachelorette_1.season_number}")
    expect(page).to have_content(@bachelorette_1.description)
    # save_and_open_page
  end

  scenario 'visitor sees a list of the outings that this contestant has been on while on the show' do
  end

  scenario 'visitor sees each outing name as a link' do
  end

  scenario 'visitor clicks outing name and is taken to that outings show page' do
  end
end
