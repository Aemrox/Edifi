class Connection < ActiveRecord::Base
  belongs_to :skill
  belongs_to :teacher, class_name: "User"
  belongs_to :student, class_name: "User"
  has_many :lessons
  has_many :appointments
end
