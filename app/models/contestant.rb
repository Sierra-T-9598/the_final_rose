class Contestant <ApplicationRecord
  belongs_to :bachelorette
  has_many :contestant_outings
  has_many :outings, through: :contestant_outings
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :hometown

  def season
    bachelorette.season_number
  end

  def season_description
    bachelorette.description
  end
end
