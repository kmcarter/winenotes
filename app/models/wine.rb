class Wine < ActiveRecord::Base
  validates_presence_of :name, :varietal, :year, :vinyard
  has_many :notes, dependent: :destroy
end