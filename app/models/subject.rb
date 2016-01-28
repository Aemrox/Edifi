class Subject < ActiveRecord::Base
  validates_uniqueness_of :name
  
  has_many :skills
end
