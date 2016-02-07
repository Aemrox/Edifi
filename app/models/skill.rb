class Skill < ActiveRecord::Base

  searchkick


  validates_uniqueness_of :name
  validates_presence_of :subject_id

  belongs_to :subject
  has_many :teacher_skills
  has_many :teachers, through: :teacher_skills, class_name: "User"


  def search_index_json
    [{value: self.name, data:"/skills/#{self.id}"}]
  end
end
