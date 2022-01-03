require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :season_number }
  end

  describe 'instance methods' do
    describe '#contestants_average_age' do
      it 'calculates the average age of all the contestants in a given show' do
        bachelorette_1 = Bachelorette.create!(name: "Hannah", season_number: 3, description: "The Most Dramatic Season Yet!")
        bachelorette_2 = Bachelorette.create!(name: "Lily", season_number: 5, description: "The Most Romantic Season Yet!")
        contestant_1 = bachelorette_1.contestants.create!(name: "Joey", age: 31, hometown: 'Charlestown')
        contestant_2 = bachelorette_1.contestants.create!(name: "Marcus", age: 26, hometown: 'Pittsburg')
        contestant_3 = bachelorette_1.contestants.create!(name: "Georgie", age: 28, hometown: 'Sandpoint')
        contestant_4 = bachelorette_2.contestants.create!(name: "Mike", age: 24, hometown: 'Bellingham')

        expect(bachelorette_1.contestants_average_age).to eq(28.33)
      end
    end
  end
end
