require 'rails_helper'

RSpec.describe "A bachelorette's contestants Index" do
  before(:each) do
    @bachelorette_1 = Bachelorette.create!(name: "Hannah", season_number: 3, description: "The Most Dramatic Season Yet!")
    @bachelorette_2 = Bachelorette.create!(name: "Lily", season_number: 5, description: "The Most Romantic Season Yet!")
    @contestant_1 = @bachelorette_1.contestants.create!(name: "Joey", age: 31, hometown: 'Charlestown')
    @contestant_2 = @bachelorette_1.contestants.create!(name: "Marcus", age: 26, hometown: 'Pittsburg')
    @contestant_3 = @bachelorette_1.contestants.create!(name: "Georgie", age: 28, hometown: 'Sandpoint')
    @contestant_4 = @bachelorette_2.contestants.create!(name: "Mike", age: 24, hometown: 'Bellingham')

    visit "/bachelorettes/#{@bachelorette_1.id}/contestants"
  end

  scenario 'visitor sees the names of that bachelorettes contestants' do
    expect(page).to have_content(@contestant_1.name)
    expect(page).to have_content(@contestant_2.name)
    expect(page).to have_content(@contestant_3.name)
    expect(page).to_not have_content(@contestant_4.name)
  end

  scenario 'visitor sees the age and hometown of each contestant' do
    expect(page).to have_content(@contestant_1.age)
    expect(page).to have_content(@contestant_1.hometown)
    expect(page).to have_content(@contestant_2.age)
    expect(page).to have_content(@contestant_2.hometown)
    expect(page).to have_content(@contestant_3.age)
    expect(page).to have_content(@contestant_3.hometown)
  end

  scenario 'visitor sees a link for each contestant' do
    expect(page).to have_link("#{@contestant_1.name}")
    expect(page).to have_link("#{@contestant_2.name}")
    expect(page).to have_link("#{@contestant_3.name}")
  end

  scenario 'visitor clicks on contestant name and is taken to that contestant show page' do
    click_link "#{@contestant_3.name}"
    expect(current_path).to eq(contestant_path(@contestant_3.id))
  end

  scenario 'visitor sees unique list of all hometowns that these contestants are from' do
    expect(page).to have_content(@contestant_1.hometown)
    expect(page).to have_content(@contestant_2.hometown)
    expect(page).to have_content(@contestant_3.hometown)
    save_and_open_page
  end
end
