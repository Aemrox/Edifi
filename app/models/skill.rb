class Skill < ActiveRecord::Base

  searchkick


  validates_uniqueness_of :name

  belongs_to :subject
  has_many :teacher_skills
  has_many :teachers, through: :teacher_skills, class_name: "User"

end
