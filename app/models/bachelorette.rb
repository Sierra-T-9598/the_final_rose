class Bachelorette <ApplicationRecord
  has_many :contestants
  validates_presence_of :name, :season_number

  def contestants_average_age
    contestants.average(:age).round(2)
  end

  def unique_hometowns_list
    contestants.select(:hometown).distinct.pluck(:hometown)
  end
end
