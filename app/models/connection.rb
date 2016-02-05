class Connection < ActiveRecord::Base
  belongs_to :teacher, class_name: "User"
  belongs_to :student, class_name: "User"
  has_many :lessons, dependent: :destroy
  has_many :appointments, class_name: "Lesson"

  validates_presence_of :teacher_id, :student_id
  validates_uniqueness_of :teacher_id, scope: :student_id

  def self.create_reciprocal_connection(connection)
    Connection.create(teacher: connection.student, student: connection.teacher, approved: true)
  end
end
