class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email, :user_name
  validates_presence_of :email, :user_name, :password_digest
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  has_many :teacher_skills, foreign_key: 'teacher_id'
  has_many :skills, through: :teacher_skills, foreign_key: 'teacher_id'
  has_many :tutorials, foreign_key: 'student_id', class_name: "Connection"
  has_many :connections, foreign_key: 'teacher_id'
  has_many :teachers, through: :tutorials
  has_many :students, through: :connections
  has_many :lessons, through: :tutorials
  has_many :appointments, through: :connections, class_name: "Lesson"
  has_many :messages, foreign_key: 'sender_id'
  has_many :messages, foreign_key: 'receiver_id'
  has_many :out_convos, :foreign_key => :sender_id, class_name: "Conversation"
  has_many :in_convos, :foreign_key => :recipient_id, class_name: "Conversation"


  def self.authenticate!(user_name, password)
    user = self.find_by(user_name: user_name)
    user.authenticate(password) if user
  end

  def self.teachers
    self.all.map{|user| user if user.teacher?}
  end

  def connected?(student_id)
    Connection.find_by(:student_id=>student_id, :teacher_id=>self.id)
  end

  def no_connections_with?(user)
    !self.connected?(user.id) && !user.connected?(self.id)
  end

  def approval_status(teacher_id)
    status = Connection.find_by(:student_id=>self.id, :teacher_id=>teacher_id)
    status.approved
  end

  def connection_requested?
    @pending_requests = Connection.where(:teacher_id=>self.id, :approved => false)
  end

  def connected_and_approved?(user)
    self.connected?(user.id) && user.approval_status(self.id)
  end

  def all_approved_lessons
    (self.lessons + self.appointments).map{|lesson| lesson if lesson.approved}.compact
  end

  def pending_lesson_requests
    self.appointments.map{|lesson| lesson unless lesson.approved}
  end

  def unapproved_lesson_requests
    self.lessons.map{|lesson| lesson unless lesson.approved}
  end

  def name
    (self.first_name && self.last_name) ? "#{self.first_name} #{self.last_name}" : user_name
  end

  def teacher?
    !self.skills.empty?
  end

  def conversations
     conversations = self.out_convos
     conversations << self.in_convos
     return conversations
  end

  def sender?(conversation)
    !!(conversation.sender == self)
  end

  def recipient?(conversation)
    !!(conversation.recipient == self)
  end

end
