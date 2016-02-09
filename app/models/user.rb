class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email, :user_name
  validates_presence_of :email, :user_name
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
  mount_uploader :attachment, AvatarUploader

  def self.authenticate!(user_name, password)
    user = self.find_by(user_name: user_name)
    user.authenticate(password) if user
  end

  def name
    (self.first_name && self.last_name) ? "#{self.first_name} #{self.last_name}" : user_name
  end

  def search_index_json
    [{value: self.name, data:"/users/#{self.id}"}]
  end

  ##Student/Teacher/Connection Methods

  def teacher?
    !self.skills.empty?
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

  def is_my_teacher?(teacher_id)
    !!Connection.find_by(:student_id=>self.id, :teacher_id=>teacher_id)
  end

  def approval_status(teacher_id)
    status = Connection.find_by(:student_id=>self.id, :teacher_id=>teacher_id)
    status.approved
  end

  def connection_requested?
    Connection.where(:teacher_id=>self.id, :approved => false)
  end

  def connected_and_approved?(user)
    self.connected?(user.id) && user.approval_status(self.id)
  end

  def approved_students
    Connection.where(:teacher_id=>self.id, :approved => true).map{|connection| connection.student}
  end

  def approved_teachers
    Connection.where(:student_id=>self.id, :approved => true).map{|connection| connection.teacher}
  end

  def unapproved_teachers
    Connection.where(:student_id=>self.id, :approved => false).map{|connection| connection.teacher}
  end

  #Lessons and Appointments Methods

  def future_approved(a_or_l)
    a_or_l == :lesson ? schedule = self.approved_lessons : schedule = self.approved_appointments
    schedule.map{|lesson| lesson if (lesson.end_time + 10.minutes) >= Time.now}.compact || []
  end

  def all_approved_lessons
    self.approved_appointments + self.approved_lessons
  end

  def approved_lessons
    self.lessons.map{|lesson| lesson if lesson.approved}.compact
  end

  def approved_appointments
    self.appointments.map{|appointment| appointment if appointment.approved}.compact
  end

  def pending_appointment_requests
    self.appointments.map{|lesson| lesson unless lesson.approved}.compact
  end

  def unapproved_lesson_requests
    self.lessons.map{|lesson| lesson unless lesson.approved}.compact
  end



  def conversations
    conversations = self.out_convos
    conversations << self.in_convos
    conversations
  end

  def sender?(conversation)
    !!(conversation.sender == self)
  end

  def recipient?(conversation)
    !!(conversation.recipient == self)
  end

  def unread_message_num
    messages = self.conversations.map{|conversation| conversation.messages}
    messages.empty? ? messages.inject {|total,message| total += 1 if !message.read} : 0
  end

  #Availability Methods

  def display_availability
    #Sample Availability "Sunday 8:00 - 20:00//Monday 9:00 - 17:00"
    self.availability ? self.availability.split("//") : []
  end

  def set_availability(array_of_days)
    self.availability = array_of_days.join("//")
  end

  def self.from_omniauth(auth_hash)
    puts auth_hash['uid']
    puts auth_hash['uid']
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.user_name = auth_hash['info']['name']
    user.email = auth_hash['info']['email'] || user.email = "softskillsgmail.com"
    user.attachment = auth_hash.info.image
    user.password = "123"
    user.password_confirmataion = "123"
    puts user
    user.save!
    user
  end


end
