class Contestant <ApplicationRecord
  belongs_to :bachelorette
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :hometown
end
