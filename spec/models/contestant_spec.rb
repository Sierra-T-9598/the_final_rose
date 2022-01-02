require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it {should belong_to :bachelorette}
  end

  describe 'validations' do
    it {should validate_presence_of :name }
    it {should validate_presence_of :age }
    it {should validate_presence_of :hometown }
  end

  describe 'instance methods' do
    describe '#season' do
      it 'gives the season the contestant is on' do
        @bachelorette_1 = Bachelorette.create!(name: "Hannah", season_number: 3, description: "The Most Dramatic Season Yet!")
        @bachelorette_2 = Bachelorette.create!(name: "Lily", season_number: 5, description: "The Most Romantic Season Yet!")
        @contestant_1 = @bachelorette_1.contestants.create!(name: "Joey", age: 31, hometown: 'Charlestown')
        @contestant_2 = @bachelorette_1.contestants.create!(name: "Marcus", age: 26, hometown: 'Pittsburg')
        @contestant_3 = @bachelorette_1.contestants.create!(name: "Georgie", age: 28, hometown: 'Sandpoint')
        @contestant_4 = @bachelorette_2.contestants.create!(name: "Mike", age: 24, hometown: 'Bellingham')

        expect(@contestant_3.season).to eq(3)
      end
    end

    describe '#season_description' do
      it 'gives the dscription associated with the season the contestant is on' do
        @bachelorette_1 = Bachelorette.create!(name: "Hannah", season_number: 3, description: "The Most Dramatic Season Yet!")
        @bachelorette_2 = Bachelorette.create!(name: "Lily", season_number: 5, description: "The Most Romantic Season Yet!")
        @contestant_1 = @bachelorette_1.contestants.create!(name: "Joey", age: 31, hometown: 'Charlestown')
        @contestant_2 = @bachelorette_1.contestants.create!(name: "Marcus", age: 26, hometown: 'Pittsburg')
        @contestant_3 = @bachelorette_1.contestants.create!(name: "Georgie", age: 28, hometown: 'Sandpoint')
        @contestant_4 = @bachelorette_2.contestants.create!(name: "Mike", age: 24, hometown: 'Bellingham')

        expect(@contestant_3.season_description).to eq(@bachelorette_1.description)
        expect(@contestant_4.season_description).to eq(@bachelorette_2.description)
      end
    end 
  end
end
