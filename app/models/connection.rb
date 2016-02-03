class Connection < ActiveRecord::Base
  belongs_to :teacher, class_name: "User"
  belongs_to :student, class_name: "User"
  has_many :lessons
  has_many :appointments, class_name: "Lesson"
end
