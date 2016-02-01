class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email, :user_name
  validates_presence_of :email, :user_name, :password_digest

  has_many :teacher_skills, foreign_key: 'teacher_id'
  has_many :skills, through: :teacher_skills, foreign_key: 'teacher_id'
  has_many :tutorials, foreign_key: 'student_id', class_name: "Connection"
  has_many :connections, foreign_key: 'teacher_id'
  has_many :teachers, through: :tutorials
  has_many :students, through: :connections
  has_many :connection_requests, foreign_key: 'teacher_id'
  has_many :students, through: :connection_requests

  def self.authenticate!(user_name, password)
    user = self.find_by(user_name: user_name)
    user.authenticate(password) if user
  end


  def self.teachers
    self.all.map{|user| user if user.teacher?}
  end

  def connected?(student_id)
    Connection.find_by(:student_id=>student_id)&& Connection.find_by(:teacher_id=>self.id)
  end

  def approval_status(teacher_id)
    @status = Connection.find_by(:student_id=>self.id)&& Connection.find_by(:teacher_id=>teacher_id)
  end

  def connection_requested?
    @pending_requests = Connection.where(:teacher_id=>self.id, :approved => false)
  end

  def teacher?
    !self.skills.empty?
  end

end
