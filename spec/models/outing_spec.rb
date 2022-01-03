require 'rails_helper'

RSpec.describe Outing, type: :model do
  describe 'relationships' do
    it { should have_many :contestant_outings }
    it { should have_many(:contestants).through(:contestant_outings) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
    it { should validate_presence_of :date }
  end

  describe 'instance methods' do
    before(:each) do
      @bachelorette_1 = Bachelorette.create!(name: "Hannah", season_number: 3, description: "The Most Dramatic Season Yet!")
      @bachelorette_2 = Bachelorette.create!(name: "Lily", season_number: 5, description: "The Most Romantic Season Yet!")
      @contestant_1 = @bachelorette_1.contestants.create!(name: "Joey", age: 31, hometown: 'Charlestown')
      @contestant_2 = @bachelorette_1.contestants.create!(name: "Marcus", age: 26, hometown: 'Pittsburg')
      @contestant_3 = @bachelorette_1.contestants.create!(name: "Georgie", age: 28, hometown: 'Sandpoint')
      @contestant_4 = @bachelorette_2.contestants.create!(name: "Mike", age: 24, hometown: 'Bellingham')

      @outing_1 = Outing.create!(name: "Kickball", location: "Homer, AK", date: "08/23/19")
      @outing_2 = Outing.create!(name: "Hot Springs", location: "Salmon, ID", date: "09/25/19")
      @outing_3 = Outing.create!(name: "Helicopter Ride", location: "Moab, UT", date: "08/25/20")
      @outing_4 = Outing.create!(name: "Dinner", location: "Salt Lake City, UT", date: "09/25/20")

      @outing_1.contestants << @contestant_3
      @outing_2.contestants << @contestant_3

      @outing_1.contestants << @contestant_1
      @outing_2.contestants << @contestant_1

      @outing_1.contestants << @contestant_2
    end

    describe '#count_contestants' do
      it 'gives a count fo all contestants involved in an outing' do
        expect(@outing_2.count_contestants).to eq(2)
        expect(@outing_1.count_contestants).to eq(3)
      end
    end
  end
end
