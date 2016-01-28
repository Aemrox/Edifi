class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email, :user_name

  has_many :teacher_skills, foreign_key: 'teacher_id'
  has_many :skills, through: :teacher_skills, foreign_key: 'teacher_id'
  has_many :tutorials, foreign_key: 'student_id', class_name: "Connection"
  has_many :connections, foreign_key: 'teacher_id'
  has_many :teachers, through: :tutorials
  has_many :students, through: :connections
end
