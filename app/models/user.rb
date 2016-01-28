class User < ActiveRecord::Base
  has_many :skills, foreign_key: 'teacher_id'
  has_many :tutorials, foreign_key: 'student_id', class_name: "Connection"
  has_many :connections, foreign_key: 'teacher_id'
  has_many :teachers, through: :tutorials
  has_many :students, through: :connections
end
