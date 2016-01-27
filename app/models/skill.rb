class Skill < ActiveRecord::Base
  belongs_to :subject
  belongs_to :teacher, class_name: "User"
end
