class Skill < ActiveRecord::Base
  belongs_to :subject
  has_many :teacher_skills
  has_many :teachers, through: :teacher_skills, class_name: "User"
end
